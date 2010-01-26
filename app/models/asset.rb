class Asset < ActiveRecord::Base
  has_many :gallery_items, :dependent => :destroy
  has_many :events, :through => :gallery_items
  has_attached_file :file,
                    :styles => {:display => "900x900>",
                                :large => "600x600>",
                                :medium => "300x300>",
                                :cover => "140x140#",
                                :thumb => "100x100>"}
                                
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
