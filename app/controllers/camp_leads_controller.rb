class CampLeadsController < ApplicationController
	 skip_before_action :verify_authenticity_token

	def index
		@camp_leads = CampLead.all
		render json: @camp_leads , status: :ok
		
	end
	def create
		@camp_lead = CampLead.new(camp_lead_params)

		@camp_lead.save
		PaymentMailer.camp_lead_response_mail(@camp_lead).deliver_later
		render json: @camp_lead, status: :created
	end

	private

	def camp_lead_params
		# binding.pry
		params.require(:camp_lead).permit(:from,:name,:email,:phone_number,:queries ,:plot_size)
	end
end
