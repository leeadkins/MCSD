ActionController::Routing::Routes.draw do |map|
  
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.resources :wanteds, :as => "most-wanted"
  map.resources :offenders, :only => [:index]
  map.resources :posts
  map.resources :pages
  #Remove the :only clause below to allow users to be created from the main site 
  map.resources :users, :only => [:edit, :update]
  map.resources :user_sessions
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.browser "admin/dashboard/browser", :controller => 'admin/dashboard', :action => 'browser'
  map.individual 'admin/dashboard/browser/individual/:id', :controller => 'admin/dashboard', :action => 'individual' 
  map.upload "admin/upload", :controller => 'admin/dashboard', :action => 'upload', :method => :post
  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  map.namespace :admin do |admin|
    # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
    admin.resources :pages, :collection => {:sort => :put}
    admin.resources :posts
    admin.resources :wanteds
    admin.resources :assets
    admin.resources :users
    admin.resources :offenders
  end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.dashboard "admin", :controller => 'admin/dashboard', :action => 'index'
  map.slugged_page "/:slug", :controller => 'pages', :action => 'slugged_get'
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
