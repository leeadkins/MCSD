class Wanted < ActiveRecord::Base
  has_attached_file :mug,
                    :styles => {:large => ["600x600>", :png],
                                :medium => ["300x300#", :png],
                                :small => ["140x140#", :png],
                                :thumb => ["100x100#", :png]},
                    :convert_options => { :thumb => '-gravity center' }
                    
  validates_attachment_content_type :mug, :content_type => ['image/jpeg', 'image/png']
  validates_presence_of :lastname, :on => :create, :message => "can't be blank"
  validates_presence_of :firstname, :on => :create, :message => "can't be blank"
end
