class Post < ActiveRecord::Base
  validates_uniqueness_of :slug, :on => :create, :message => "must be unique", :case_sensitive => false
  validates_presence_of :title, :on => :create, :message => "can't be blank"
 
  before_validation :normalize
  
  named_scope :published, :conditions => {:published => true}
  def to_param
    "#{id}-#{slug}" || super
  end
  
  def fix_slug
    #So, we know there is a slug already called this, we, don't know how many there are though.
    #Thus, we need a sad little loop....
    #We'll only enter the loop if there are TWO things named this already...
    #Surely, this won't happen often
    self.slug = self.slug + "-1"
    while self.invalid?
      self.slug = self.slug+"-1"
    end
  end
  
  
  private
  def normalize
    #if we don't have a slug, we need one... if not, let's got from there...
    if self.slug == nil || self.slug == ""
      self.slug = self.title.downcase.parameterize
    else
      self.slug.downcase!
      self.slug = self.slug.parameterize
    end
  end
end
