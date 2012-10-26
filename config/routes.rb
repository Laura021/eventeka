Consola::Application.routes.draw do
  devise_for :usuarios

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :usuarios

  #My routes
  
  match "ciudades" => "ciudad#index"
  match "ciudades/:id" => "ciudad#show", :as => :ciudad_detail
 
  get "evento/nuevo"
  get "evento/create"
  #get "evento/editar"

  match "eventos/list" =>"evento#index"
  match "eventos/" => "evento#create"
  match "eventos/nuevo" => "evento#nuevo"
  match "eventos/:id"=> "evento#show", :as => :evento_detail
  match "eventos/eliminar/:id" => "evento#eliminar", :as => :eventos_eliminar
  match "eventos/:id/editar" =>"evento#editar", :as => :eventos_editar
  
  
  match "eventos/:id/update" =>"evento#update", :as => :evento_update

  get "sugerencia/nuevo"
  get "sugerencia/create"
  
  match "sugerencia/index" => "sugerencia#index"
  match "sugerencia/" =>"sugerencia#create"
  match "sugerencia/nuevo" => "sugerencia#nuevo"

  match "categorias" => "categoria#index"
  match "categotias/:id" => "categoria#show", :as => :categoria_detail
  
  match "perfil/:id" => "usuario#show", :as => :usuario_profile

  match "fechas" => "calendario#index", :as => :fechas_list
  
  match "servicios/categoria" =>"servicios#listado_categorias"
  match "servicios/categoria_detail" => "servicios#catego_detail"
  
  match "servicios/ciudad_detail" => "servicios#consulta_ciudad"
  match "servicios/ciudad" => "servicios#listado_ciudad"
  
  match "servicios/evento" => "servicios#listado_evento"
  match "servicios/evento_detail" => "servicios#consulta_evento"
 
  match "servicios/usuario_info" => "servicios#info_usuario"
  
  match "servicios/ciudad_evento" =>"servicios#ciudad_eventos"
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
  # root :to => 'welcome#index'

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
