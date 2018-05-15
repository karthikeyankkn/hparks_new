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
def create
	# binding.pry
	@user_detail = UserDetail.new(user_detail_params)
	# binding.pry
	if @user_detail.save
		# binding.pry
		PaymentMailer.lead_registration(@user_detail).deliver_now
		PaymentMailer.lead_post(@user_detail).deliver_now
		redirect_to controller: 'payments', action: 'requestHandler', order_id: @user_detail[:id] 
 
	else
		# binding.pry
		render 'new'
	end
end
private
  def user_detail_params
    params.require(:user_detail).permit(:name, :email, :plot_details,:number,:payment_status,:description)
  end	

end