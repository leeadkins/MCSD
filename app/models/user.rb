class User < ActiveRecord::Base
  acts_as_authentic
  bitmask :roles, :as => [:visitor, :business, :officer, :superuser, :admin]
end
