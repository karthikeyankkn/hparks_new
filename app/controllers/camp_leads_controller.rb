class CampLeadsController < ApplicationController
	 skip_before_action :verify_authenticity_token

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
	end

	private

	def camp_lead_params
		# binding.pry
		params.require(:camp_lead).permit(:from,:name,:email,:phone_number,:queries ,:plot_size)
	end
end
