class Post < ActiveRecord::Base
  validates_uniqueness_of :slug, :on => :create, :message => "must be unique"
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :slug, :on => :create, :message => "can't be blank"
end
