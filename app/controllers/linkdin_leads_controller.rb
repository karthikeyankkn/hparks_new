class LinkdinLeadsController < ApplicationController
	skip_before_action :verify_authenticity_token
  
	def create
		@linkdin_lead = LinkdinLead.new(linkdin_lead_params)
		if @linkdin_lead.save

			PaymentMailer.spini_linkdin_leads(@linkdin_lead).deliver_later
			render json: @linkdin_lead, status: :created
		else
		 	render json: @linkdin_lead.errors.full_messages, status: :bad_request
		end
	end


	private

	def linkdin_lead_params
		params.require(:linkdin_lead).permit(:name, :email, :phone_number, :work_phone_number, :company_name, :site_visit_date, :designation)
	end
end
