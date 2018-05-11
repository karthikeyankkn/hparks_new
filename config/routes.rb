Rails.application.routes.draw do
	root :to => "payments#new"
	post "transaction/ccavRequestHandler",to: "payments#requestHandler"
	get "success",to: "payments#finish"
	post "transaction/ccavResponseHandler",to: "payments#responseHandler"
  # resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
