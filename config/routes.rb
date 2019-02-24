Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	namespace :api do
  		namespace :v1 do
  			get "sales/total_sales", to:"sales#total_sales"
  			get "sales/items_quantity", to:"sales#items_quantity"
  			resources :sales do
  				resources :sale_items
			end
		end
	end
end
