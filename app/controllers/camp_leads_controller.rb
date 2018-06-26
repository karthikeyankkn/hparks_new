# require 'httparty'
class CampLeadsController < ApplicationController
	 skip_before_action :verify_authenticity_token
	 # include HTTParty
	 include HTTParty

	def index
		# binding.pry
		@start_date = params[:start_date]
		@end_date = params[:end_date]
		if params[:type] == "web-lead"
			@filterLeads = UserDetail.where("created_at between (?) and (?)",@start_date ,@end_date )
		else
			@camp_leads = CampLead.where("created_at between (?) and (?)",@start_date ,@end_date )
			if params[:from] == "google"
				@filterLeads = @camp_leads.where(from:"google")
			elsif params[:from] == "facebook"
				@filterLeads = @camp_leads.where(from:"facebook")
			elsif params[:from] == "spini"
					@test1 = @camp_leads.where.not(from:"google")
					@test2 = @test1.where.not(from:"facebook")
					@filterLeads = @test2
					# @tests.each do |testing|
					# if testing[:from] != "google" && testing[:from] != "facebook"
						# @filterLeads.push(testing)
					# end
			end
		end			
		# @camp_leads = CampLead.where("created_at between (?) and (?)",@start_date ,@end_date )
		# @camp_leads = CampLead.all
		# render json: @camp_leads , status: :ok
		respond_to do |format|
			format.csv { send_data @filterLeads.to_csv}
			format.xls { send_data @filterLeads.to_csv(col_sep: "\t")}

		end
		
	end
	def create
		@camp_lead = CampLead.new(camp_lead_params)

		if @camp_lead.save
			# binding.pry
			if @camp_lead[:from] != "google" && @camp_lead[:from] != "facebook"
				# binding.pry
				# PaymentMailer.spini_camp_leads(@camp_lead).deliver_later
				render json: @camp_lead, status: :created
			else
				# PaymentMailer.camp_lead_response_mail(@camp_lead).deliver_later
				render json: @camp_lead, status: :created
			end
		else
			render json: @camp_lead.errors, status: :unprocessable_entity
		end
		# binding.pry
		if @camp_lead.from == "facebook"
		@data = { api_key: "1bd54866736339b8f49efe4cbd3404b8",
				sell_do: {
					form: {
						lead: {
							first_name: @camp_lead[:name],
							last_name: "",
							email: @camp_lead[:email],
							phone: @camp_lead[:phone_number]
							# project_id: "56659cb03bb2f8f46900001b"
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
						campaign: {
							 srd: "5b2797cb923d4a68368cb4c6" 
							}
					# sell_do: { campaign: { srd: "5b2797cb923d4a68368cb4c6" }}
					}
				}
			# @response = HTTParty.post('https://app.sell.do/api/leads/create',
			# 	{ 
   #  			:body => @data.to_json,
   #  			:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  	# 			});

			elsif @camp_lead.from == "google"
				@data = { api_key: "1bd54866736339b8f49efe4cbd3404b8",
				sell_do: {
					form: {
						lead: {
							first_name: @camp_lead[:name],
							last_name: "",
							email: @camp_lead[:email],
							phone: @camp_lead[:phone_number]
							# project_id: "56659cb03bb2f8f46900001b"
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
						campaign: { 
								srd: "5b279800923d4a388d1bb2c2"
							}
					# sell_do: { campaign: { srd: "5b279800923d4a388d1bb2c2" }}
					}
				}
				# @response = HTTParty.post('https://app.sell.do/api/leads/create',
				# { 
    # 			:body => @data.to_json,
    # 			:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  		# 		});
			else
				# binding.pry
			end
			
		# @response = HTTParty.post('https://app.sell.do/api/leads/create',
		# 	{ 
  #   			:body => @data.to_json,
  #   			:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  # 			});
    	# binding.pry
		

	end

	

	private

	def camp_lead_params
		# binding.pry
		params.require(:camp_lead).permit(:from,:name,:email,:phone_number,:queries ,:plot_size)
	end
end
