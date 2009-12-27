class User < ActiveRecord::Base
  acts_as_authentic
  bitmask :roles, :as => [:visitor, :business, :officer, :superuser, :admin]
  
  #Let's us see what kind of roles are defined, but as symbols
  def self.allroles
    roles = []
    User.bitmasks[:roles].each do |r|
      roles << r[0].to_sym
    end
    return roles
  end
  #needed for dec_auth
  def role_symbols
    return self.roles
  end
end
