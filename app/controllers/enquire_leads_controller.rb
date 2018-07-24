class EnquireLeadsController < ApplicationController
	skip_before_action :verify_authenticity_token
  include HTTParty

	def create
		@enquire_lead = EnquireLead.new(enquire_lead_params)

		if @enquire_lead.save

			PaymentMailer.spini_enquire_leads(@enquire_lead).deliver_later
			render json: @enquire_lead, status: :created

			# send saved details to sell.do
			@data = { api_key: "1bd54866736339b8f49efe4cbd3404b8",
				sell_do: {
					form: {
						lead: {
							first_name: @enquire_lead[:name],
							last_name: "",
							email: @enquire_lead[:email],
							phone: @enquire_lead[:phone_number]
							# project_id: "56659cb03bb2f8f46900001b"
							},
						note:{
							content:  @enquire_lead[:comments]
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
							locations: [],
							bhk: ["2","2.5"],
							min_budget: 0,
							max_budget: 0,
							min_possession: "",
							max_possession: ""
							}
						},
						campaign: {
							 srd: "5b2793ea923d4a68368cb3b6"
							}
					# sell_do: { campaign: { srd: "5b2797cb923d4a68368cb4c6" }}
					}
				}
			@response = HTTParty.post('https://app.sell.do/api/leads/create',
				{ 
    			:body => @data.to_json,
    			:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  				});
		else
		 	render json: @enquire_lead.errors.full_messages, status: :bad_request
		end
	end


	private

	def enquire_lead_params
		params.require(:enquire_lead).permit(:source,:name,:email,:phone_number,:comments)
	end
end
