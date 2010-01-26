class GalleryItem < ActiveRecord::Base
belongs_to :event
belongs_to :asset
end
