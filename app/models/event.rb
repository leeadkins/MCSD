class Event < ActiveRecord::Base
has_many :gallery_items, :dependent => :destroy
has_many :assets, :through => :gallery_items
accepts_nested_attributes_for :assets, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }, :allow_destroy => true
end
