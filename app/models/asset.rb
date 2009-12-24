class Asset < ActiveRecord::Base
  has_attached_file :file,
                    :styles => {:large => "600x600>",
                                :medium => "300x300>",
                                :thumb => "100x100>"}
                                
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
