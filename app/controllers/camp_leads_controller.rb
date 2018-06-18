# require 'httparty'
class CampLeadsController < ApplicationController
	 skip_before_action :verify_authenticity_token
	 # include HTTParty
	 include HTTParty

	def index
		# binding.pry
		@start_date = params[:start_date]
		@end_date = params[:end_date]
		@camp_leads = CampLead.where("created_at between (?) and (?)",@start_date ,@end_date )
		# @camp_leads = CampLead.all
		# render json: @camp_leads , status: :ok
		respond_to do |format|
			format.csv { send_data @camp_leads.to_csv}
			format.xls { send_data @camp_leads.to_csv(col_sep: "\t")}

		end
		
	end
	def create
		@camp_lead = CampLead.new(camp_lead_params)

		if @camp_lead.save
			PaymentMailer.camp_lead_response_mail(@camp_lead).deliver_later
			render json: @camp_lead, status: :created
		else
			render json: @camp_lead.errors, status: :unprocessable_entity
		end
		# binding.pry
		if @camp_lead.from == "facebook"
		@data = { api_key: "1448606074",
				sell_do: {
					form: {
						lead: {
							first_name: @camp_lead[:name],
							last_name: "",
							email: @camp_lead[:email],
							phone: @camp_lead[:phone_number],
							project_id: "56659cb03bb2f8f46900001b"
							},
						note:{
							content:  @camp_lead[:queries]
							},
						address:{
							address1: "",
							address2: "",
							country: "India",
							state: "tamilnadu",
							city: "city",
							zip: "0"
							},
						requirement:{
							property_types: [@camp_lead[:plot_size]],
							locations: [],
							bhk: ["2","2.5"],
							min_budget: 0,
							max_budget: 0,
							min_possession: "",
							max_possession: ""
							}
						},
					sell_do: { campaign: { srd: "5b2797e7923d4a6acb8cb241" }}
					}
				}
			else
				@data = { api_key: "1448606074",
				sell_do: {
					form: {
						lead: {
							first_name: @camp_lead[:name],
							last_name: "",
							email: @camp_lead[:email],
							phone: @camp_lead[:phone_number],
							project_id: "56659cb03bb2f8f46900001b"
							},
						note:{
							content:  @camp_lead[:queries]
							},
						address:{
							address1: "",
							address2: "",
							country: "India",
							state: "tamilnadu",
							city: "city",
							zip: "0"
							},
						requirement:{
							property_types: [@camp_lead[:plot_size]],
							locations: [],
							bhk: ["2","2.5"],
							min_budget: 0,
							max_budget: 0,
							min_possession: "",
							max_possession: ""
							}
						},
					sell_do: { campaign: { srd: "5b279800923d4a388d1bb2c2" }}
					}
				}
			end

		@response = HTTParty.post('https://app.sell.do/api/leads/create',
			{ 
    			:body => @data.to_json,
    			:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  			});
  # @eee = Net::HTTP.post_form(URI.parse('https://app.sell.do/api/leads/create'), @data.to_json)
    	# binding.pry
		

	end

	private

	def camp_lead_params
		# binding.pry
		params.require(:camp_lead).permit(:from,:name,:email,:phone_number,:queries ,:plot_size)
	end
end
