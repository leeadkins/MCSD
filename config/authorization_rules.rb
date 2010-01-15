#Dec_Auth Authorization Rules

authorization do
  role :guest do
    has_permission_on [:pages, :posts, :wanteds, :home], :to => :read
  end
  
  role :visitor do
    includes :guest
  end
  
  role :business do
    includes :visitor
    #Add Business Portal Authorization here..
  end
  
  role :officer do
    includes :visitor
    has_permission_on [:admin_pages, :admin_posts, :admin_wanteds, :admin_dashboard, :admin_assets], :to =>:read
  end
  
  role :superuser do
    includes :officer
  end 
  
  role :admin do
    includes :superuser
    has_permission_on :admin_pages, :to => :manage
    has_permission_on :admin_posts, :to => :manage
    has_permission_on :admin_wanteds, :to => [:sort, :manage]
    has_permission_on :admin_assets, :to => :manage
    has_permission_on :admin_dashboard, :to => [:manage, :browser, :upload, :individual]
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_offenders, :to => :manage
  end
end

privileges do
  privilege :manage do
    includes :create, :read, :update, :delete, :sort
  end
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end