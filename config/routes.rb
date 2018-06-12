Rails.application.routes.draw do
  resources :homes
	# root :to => "payments#new"
	# root :to => "user_details#new" use this for paymment gateway
	get "Plot-booking", to: "user_details#new"
	# root :to => 'homes#index'
	#get "about-us",to: "homes#aboutus"
	#get "about-oragadam",to: "homes#about_oragadam"
	#get "plots-oragadam",to: "homes#plots_oragadam"
	#get "apartment", to: "homes#apartment"
	#get "amenities",to: "homes#amenities"
	#get "rental", to: "homes#rental"
	#get "commercial-retail",to: "homes#commercial_retail"
	#get "contact-us", to: "homes#contact_us"
	#get "testimonial", to: "homes#testimonial"
	#get "policies", to: "homes#policies"
	#get "sitemap.xml", to: "homes#sitemap", :defaults => {:format => 'xml'}
	#get "site-map.html", to: "homes#sitemap2"
	post "Plot-booking/create",to:  "user_details#create"
	

	# post "transaction/ccavRequestHandler",to: "payments#requestHandler"
	get "Plot-booking/transaction/ccavRequestHandler",to: "payments#requestHandler"

	get "Plot-booking/success",to: "payments#finish"
	post "Plot-booking/transaction/ccavResponseHandler",to: "payments#responseHandler"
	# resources :camp_leads
	post "Plot-booking/camp_lead/new", to: "camp_leads#create"

  # resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
