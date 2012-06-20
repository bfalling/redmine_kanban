RedmineApp::Application.routes.draw do
  resource :kanban do
    put 'sync', :on => :member
    resources :users, :controller => 'user_kanbans', :as => 'user_kanbans'
    #resource "my-requests", :controller => 'user_kanbans'
    resources "assigned-to", :controller => 'assigned_kanbans', :as => 'assigned_kanbans'
    #resource "my-assigned", :controller => 'assigned_kanbans', :only => [:show]
    resource :overview, :controller => 'kanban_overviews', :only => [:show]
  end
  match '/kanban/my-requests(/:id)' => 'user_kanbans#show'
  match '/kanban/my-requests' => 'user_kanbans#create', :via => :post
  #match '/kanban/assigned-to(/:id)' => 'assigned_kanbans#show', :as => 'kanban_assigned_kanbans'
  match '/kanban/assigned-to' => 'assigned_kanbans#create', :via => :post
  match '/kanban/my-assigned(/:id)' => 'assigned_kanbans#show'
  resources :kanban_issues
end
