Rails.application.routes.draw do
  resources :homes
	# root :to => "payments#new"
	# root :to => "user_details#new" use this for paymment gateway
	root :to => 'homes#index'
	get "about-us",to: "homes#aboutus"
	get "about-oragadam",to: "homes#about_oragadam"
	get "plots-oragadam",to: "homes#plots_oragadam"
	get "apartment", to: "homes#apartment"
	get "amenities",to: "homes#amenities"
	get "rental", to: "homes#rental"
	get "commercial-retail",to: "homes#commercial_retail"
	get "contact-us", to: "homes#contact_us"
	post "create",to:  "user_details#create"

	# post "transaction/ccavRequestHandler",to: "payments#requestHandler"
	get "transaction/ccavRequestHandler",to: "payments#requestHandler"

	get "success",to: "payments#finish"
	post "transaction/ccavResponseHandler",to: "payments#responseHandler"
  # resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
