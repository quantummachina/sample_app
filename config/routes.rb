SampleApp::Application.routes.draw do

  resources :lines, only:[:create, :index]

  resources :conversations, only:[:create, :index, :show]

  get "likes/create"

  get "likes/destroy"

  get "comments/create"

  get "comments/destroy"

  get "ideas/create"

  get "ideas/index"

  get "ideas/destroy"

  resources :categories

  #get "projects/new"

  resources :users do
    member do
      get :following, :followers, :collaborations
    end
  end


  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only:[:create, :destroy]
  resources :collabs, only:[:create, :destroy]
  resources :resources, only:[:create, :destroy] do
    member do
      get :crosspost
    end
  end
  resources :inspirations, only:[:create, :destroy, :index] do
      member do
      get :crosspost
    end
  end
  resources :needs
  resources :tasks, only:[:create, :destroy] do #quito :check dentro de only porque al parecer no se necesita
    member do
      get :check
    end
  end

  resources :ideas, only:[:create, :destroy, :publish] do
    member do
      get :publish
    end
  end
  
  resources :likes, only:[:create, :destroy]
  resources :comments, only:[:create, :destroy]

  resources :projects do
    member do
      get :collaborators, :resources
    end
  end
  resources :thrds, only:[:create, :destroy]
  resources :commenthrds, only:[:create, :destroy]
  resources :updates, only:[:create, :destroy]

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/uploadpic', to: 'users#upload_photo'
  #match '/upload_file' to: '/app/controllers#users_controller'
  #match '/user_projects', to: 'static_pages#show_projects'
  match '/start_project', to: 'projects#new'
  match '/upload_cover', to: 'projects#upload_cover'
  match '/delete_cover', to: 'projects#delete_cover'
  match '/nav', to: 'projects#index'
  match '/sort', to: 'projects#sort'
  match '/publish', to: 'ideas#publish'
  match '/board', to: 'inspirations#index'

  root to: 'users#home' #'projects#index' 
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
