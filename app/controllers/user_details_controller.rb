class UserDetailsController < ApplicationController
skip_before_action :verify_authenticity_token
def new
	@plots = PlotSize.all
	@user_detail = UserDetail.new
	
	# @some = {}
	# @arr = ["vvv=karthik","age=asasas","occ=software"]
	# @arr.each do |key|
	# 	binding.pry
 #        @some["#{key.from(0).to(key.index("=")-1)}"] = "#{key.from(key.index("=")+1).to(-1)}"
 #      end
 #      binding.pry
 #      @order_id = @some["vvv"]
 #       binding.pry
end
def redirect
	# binding.pry
	redirect_to controller: 'payments', action: 'requestHandler', id: params[:id] 
end
def create
	# binding.pry
	@user_detail = UserDetail.new(user_detail_params)
	# binding.pry
	if @user_detail.save
		# binding.pry
		############use this if paymet needed
		# PaymentMailer.lead_registration(@user_detail).deliver_later
		# PaymentMailer.lead_post(@user_detail).deliver_later
		redirect_to plot_booking_confirmation_success_path(@user_detail)
		############# end cuurent prodution down #############################
		# PaymentMailer.lead_registration(@user_detail).deliver_later
		# PaymentMailer.lead_post(@user_detail).deliver_later
		# redirect_to plot_booking_thank_you_path(@user_detail)
		##################################################
		# redirect_to controller: 'payments', action: 'requestHandler', order_id: @user_detail[:id] 
 
	else
		# binding.pry
		@user_detail.errors.full_messages.each do |key|
			flash[:warning] = key
		end
		# flash[:warning] = "Contact number should be minimum 10 to maximum 15 digits"
		redirect_to action: 'new'
	end
	
		@data = { api_key: "1bd54866736339b8f49efe4cbd3404b8",
				sell_do: {
					form: {
						lead: {
							first_name: @user_detail[:name],
							last_name: "",
							email: @user_detail[:email],
							phone: @user_detail[:number]
							# project_id: "56659cb03bb2f8f46900001b"
							},
						note:{
							content:  @user_detail[:queries]
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
							property_types: [@user_detail[:plot_details]],
							locations: [],
							bhk: ["2","2.5"],
							min_budget: 0,
							max_budget: 0,
							min_possession: "",
							max_possession: ""
							}
						},
					sell_do: { campaign: { srd: "5b2793ea923d4a68368cb3b6" }}
					}
				}
			# @response = HTTParty.post('https://app.sell.do/api/leads/create',
			# { 
   #  			:body => @data.to_json,
   #  			:headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  	# 		});	
  			# binding.pry
end
def edit
	# binding.pry
	 @user_detail = UserDetail.find(params[:id])
	 	# binding.pry
end
## Remove this thankyou if original payment comes################
def thankyou
	@user_detail = UserDetail.find(params[:id])
end
private
  def user_detail_params
    params.require(:user_detail).permit(:name, :email, :plot_details,:number,:payment_status,:description)
  end	

end