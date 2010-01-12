require 'rest_client'
require 'nokogiri'
require 'open-uri'

#Our loader function
#0 ID
#1 Image
#2 Last Name
#3 Firstname
#4 Middle
#5 Address
#6 City
#7 Details ASP Target
def content_type(ext)
  case ext
  when "gif": "image/gif"
  when "jpg": "image/jpeg"
  when "png": "image/png"
  else "application/octet-stream"
  end
end

def image_type(file)
  case file.read(10)
    when /^GIF8/: 'gif'
    when /^\x89PNG/: 'png'
    when /^\xff\xd8\xff\xe0\x00\x10JFIF/: 'jpg'
    when /^\xff\xd8\xff\xe1(.*){2}Exif/: 'jpg'
  else 'unknown'
  end
end

def load_via_doc(doc,offenders)
  doc.css("#DataGrid1 tr").each do |row|
    #This Unless ensures we don't look at the Header row or the pagination row
    unless row.css("td b")[0].text == "TID" || row.css("td font b span").first != nil
      current = {}
      current[:tid] = row.css("td b")[0].text
      current[:image] = open("http://www.ticic.state.tn.us/sorsql?sql=EXEC+SP_SOR_IMAGE+%22#{current[:tid]}%22")
      current[:lastname] = row.css("td b")[2].text
      current[:firstname] = row.css("td b")[3].text
      current[:middle] = row.css("td b")[4].text
      current[:address] = row.css("td b")[5].text
      current[:city] = row.css("td b")[6].text
      current[:linktarget] = row.css("td b")[7].text
      offenders << current
    end
  end  
end

def get_registry
  offenders = []
  viewstate = ""
  targets = []
  argument = ""
  #Here is the original form
  list = "http://www.ticic.state.tn.us/sorinternet/SOFind.aspx?strhold=u=MARION"
  #Get the first page of results...
  result = RestClient.get list
  #Load the document
  doc = Nokogiri::HTML.parse result
  #Prepare Viewstate and variables
  inputs = doc.css('input')
  inputs.each do |i| 
    if i[:name] == "__VIEWSTATE"
      viewstate = i[:value]
    end
  end
  #Get Array of Pages
  doc.css("td:nth-child(1) a").each do |a|
    text = a[:href]
    text = text[/[0-9A-Za-z]*\$_[0-9A-Za-z]*\$_[0-9A-Za-z]*/]
    unless text == nil
      text.gsub!(/\$/, ":")
      targets << text
    end
  end

  #Begin parsing pages
  #first, parse the first page we already have...
  load_via_doc(doc, offenders)


  #Then, look through the targets to create
  for target in targets
    result = RestClient.post list, :EVENTARGUMENT => "", :__VIEWSTATE => viewstate, :__EVENTTARGET => target
    doc = Nokogiri::HTML.parse result
    load_via_doc(doc, offenders)
  end
  return offenders
end

namespace :sakura do
  namespace :sor do
    desc "Load Sex Offender Registry"
    task :load => :environment do
      offenders = get_registry
      for person in offenders
        o = Offender.new
        o.tid = person[:tid]
        o.lastname = person[:lastname]
        o.firstname = person[:firstname]
        o.middle = person[:middle]
        o.city = person[:city]
        o.target = person[:linktarget]
        o.address = person[:address]
        #Now, we need to handle this whole image problem
        o.image = person[:image]
        o.save
        puts "Created SOR Entry: #{o.tid}"
      end
    end
  
    desc "Reset the Sex Offender Registry"
    task :reset => :environment do
      Offender.find(:all).each do |o|
        o.destroy
      end
    end
    
    namespace :update do
      desc "Resyncs the database with the TBI Registry, adding and deleting as needed"
      task :all => :environment do
         offenders = get_registry
          temp = []
          current = Offender.all
          for offender in offenders
            if !current.any?{|o| o.tid == offender[:tid]}
              #If it's in the registry and not in our list
              temp << offender
              puts "Found a new offender"
            else
              #if it's in our registry and IS in out list
              current.delete_if {|o| o.tid == offender[:tid]}
            end
          end
          
          #Now, temp should have new ones, and current should only
          #have those that aren't in the TBI database anymore
          
          for person in current
            puts "Removing Old SOR Entry: #{person.tid}"
            person.destroy
          end
          
          for person in temp
            o = Offender.new
            o.tid = person[:tid]
            o.lastname = person[:lastname]
            o.firstname = person[:firstname]
            o.middle = person[:middle]
            o.city = person[:city]
            o.target = person[:linktarget]
            o.address = person[:address]
            #Now, we need to handle this whole image problem
            o.image = person[:image]
            o.save
            puts "Created SOR Entry: #{o.tid}"
          end  
      end
      
      desc "Only adds new offenders to the registry, doesn't delete old."
      task :new => :environment do
        offenders = get_registry
        temp = []
        current = Offender.all
        for offender in offenders
          if !current.any?{|o| o.tid == offender[:tid]}
            temp << offender
            puts "Found a new offender"
          end
        end
        for person in temp
          o = Offender.new
          o.tid = person[:tid]
          o.lastname = person[:lastname]
          o.firstname = person[:firstname]
          o.middle = person[:middle]
          o.city = person[:city]
          o.target = person[:linktarget]
          o.address = person[:address]
          #Now, we need to handle this whole image problem
          o.image = person[:image]
          o.save
          puts "Created SOR Entry: #{o.tid}"
        end
      end
    end
    
    desc "Lists current entries in the Sex Offender Registry"
    task :list => :environment do
      Offender.find(:all).each do |o|
        puts [o.firstname,o.lastname].join(" ")
      end
    end
    
  end
end