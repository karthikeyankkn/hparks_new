class Payment < ApplicationRecord
	def self.decrypt(encrpt_data)
		@working_key="28177749CE3784F5BECC20C6A20DBF1B"#Put in the 32 Bit Working Key provided by CCAVENUES.   
	      @encResponse=encrpt_data
	      @crypto = Crypto.new 
	      @decResp=@crypto.decrypt(@encResponse,@working_key);
	      @decResp = @decResp.split("&")

	      @resultData = {}
	      @decResp.each do |key|
	        @resultData["#{key.from(0).to(key.index("=")-1)}"] = "#{key.from(key.index("=")+1).to(-1)}"
	      end
	      @order = Order.find_by_order_placed_id(@resultData["order_id"])
	      @user = @order.user_detail
	      # @user = UserDetail.find_by_order_id(@resultData["order_id"])

	      # @user.each do |key,value| 
	      #   @resultData["#{key}"] = value 
	      # end
	      ###############################
	      @order_status = @resultData["order_status"]
	      if @order_status == "Success"
	        # @user[:payment_status] = true
	        @order[:payment_status] = true
	        # @user.save
	        @order.save
	      end
	      # PaymentMailer.payment_user_confirmation(@user,@resultData).deliver_later
	      # PaymentMailer.payment_response_confirmation(@user,@resultData).deliver_later
	      ################################# 
	      # @order_id = @result["order_id"]
	      # @user_id = @decResp[:order_id]
	end
end
