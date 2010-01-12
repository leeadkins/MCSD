class Offender < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {:large => ["600x600>", :png],
                                :medium => ["300x300#", :png],
                                :thumb => ["100x100#", :png]},
                    :convert_options => { :thumb => '-gravity center' }
end
