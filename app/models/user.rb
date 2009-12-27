class User < ActiveRecord::Base
  acts_as_authentic
  bitmask :roles, :as => [:visitor, :business, :officer, :superuser, :admin]
  
  #needed for dec_auth
  def role_symbols
    return self.roles
  end
end
