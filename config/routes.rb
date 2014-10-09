Rails.application.routes.draw do

  # get 'tastemakers/index'
  # get 'tastemakers/show'
  # get 'tastemakers/create'
  # get 'tastemakers/new'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/create'
  # get 'posts/new'
  # get 'guesses/index'
  # get 'guesses/create'
  # get 'guesses/update'

 devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }


 resources :tastemakers
 resources :posts
 resources :items
 resources :users
 resources :instagrams
 resources :guesses
 

 root to: "items#index"
 # get '/users/index', to: 'users#index'

 get "/get_instagram" => "instagrams#get_instagrams"
 # get "/show_instagram" => "instagrams#index"
 # get "/instagrams/:id" => "instagrams#show"


#if the user signed up with Twitter, or perhaps for some reason the OAuth provider didn’t provide a verified email address, or maybe you just want to get some extra information from the user, then we need to implement an extra step for this.
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
