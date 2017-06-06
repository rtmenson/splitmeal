Rails.application.routes.draw do
  root to: "parties#index"
  # Routes for the Diner resource:
  # CREATE
  get "/diners/new", :controller => "diners", :action => "new"
  post "/create_diner", :controller => "diners", :action => "create"

  # READ
  get "/diners", :controller => "diners", :action => "index"
  get "/diners/:id", :controller => "diners", :action => "show"

  # UPDATE
  get "/diners/:id/edit", :controller => "diners", :action => "edit"
  post "/update_diner/:id", :controller => "diners", :action => "update"

  # DELETE
  get "/delete_diner/:id", :controller => "diners", :action => "destroy"
  #------------------------------

  # Routes for the Share resource:
  # CREATE
  get "/shares/new", :controller => "shares", :action => "new"
  post "/create_share", :controller => "shares", :action => "create"

  # READ
  get "/shares", :controller => "shares", :action => "index"
  get "/shares/:id", :controller => "shares", :action => "show"

  # UPDATE
  get "/shares/:id/edit", :controller => "shares", :action => "edit"
  post "/update_share/:id", :controller => "shares", :action => "update"

  # DELETE
  get "/delete_share/:id", :controller => "shares", :action => "destroy"
  #------------------------------

  # Routes for the Party resource:
  # CREATE
  get "/parties/new", :controller => "parties", :action => "new"
  post "/create_party", :controller => "parties", :action => "create"

  # READ
  get "/parties", :controller => "parties", :action => "index"
  get "/parties/:id", :controller => "parties", :action => "show"

  # UPDATE
  get "/parties/:id/edit", :controller => "parties", :action => "edit"
  post "/update_party/:id", :controller => "parties", :action => "update"

  # DELETE
  get "/delete_party/:id", :controller => "parties", :action => "destroy"
  #------------------------------

  # Routes for the Order resource:
  # CREATE
  get "/orders/new", :controller => "orders", :action => "new"
  post "/create_order", :controller => "orders", :action => "create"

  # READ
  get "/orders", :controller => "orders", :action => "index"
  get "/orders/:id", :controller => "orders", :action => "show"

  # UPDATE
  get "/orders/:id/edit", :controller => "orders", :action => "edit"
  post "/update_order/:id", :controller => "orders", :action => "update"

  # DELETE
  get "/delete_order/:id", :controller => "orders", :action => "destroy"
  #------------------------------

  # Routes for the Menu_item resource:
  # CREATE
  get "/menu_items/new", :controller => "menu_items", :action => "new"
  post "/create_menu_item", :controller => "menu_items", :action => "create"

  # READ
  get "/menu_items", :controller => "menu_items", :action => "index"
  get "/menu_items/:id", :controller => "menu_items", :action => "show"

  # UPDATE
  get "/menu_items/:id/edit", :controller => "menu_items", :action => "edit"
  post "/update_menu_item/:id", :controller => "menu_items", :action => "update"

  # DELETE
  get "/delete_menu_item/:id", :controller => "menu_items", :action => "destroy"
  #------------------------------

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"



end
