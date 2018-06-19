class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token


  def requestHandler
    @user = UserDetail.find(params[:user_id])
    # @user[:order_id] = (Time.now.to_f * 1000).to_i
    @order = Order.new(orders)
    @order[:order_placed_id] = (Time.now.to_f * 1000).to_i
    @order[:user_detail_id] = params[:user_id]
    if @order.save
      @merchantData="order_id=#{@order[:order_placed_id]}&merchant_id=168876&amount=20000&currency=INR&redirect_url=https://hparks.getspini.in/Plot-booking/transaction/ccavResponseHandler&cancel_url=https://hparks.getspini.in/Plot-booking/transaction/ccavResponseHandler&language=EN"
      @working_key="28177749CE3784F5BECC20C6A20DBF1B"   #Put in the 32 Bit Working Key provided by CCAVENUES.  
      @access_code="AVJW01FC55BA81WJAB"   #Put in the Access Code in quotes provided by CCAVENUES.
        # params.each do |key,value|
        #   binding.pry
        #   @merchantData += key+"="+value+"&" 
        # end
        @crypto = Crypto.new
        @encrypted_data = @crypto.encrypt(@merchantData,@working_key)
        response = HTTParty.post("https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction&encRequest=#{@encrypted_data}&access_code=#{@access_code}")
        # response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction&encRequest=#{@encrypted_data}&access_code=#{@access_code}"
        # "https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction&encRequest=#{encrypted_data}&access_code=#{access_code}"
        # binding.pry
        @finalResponse = response
        # @finalResponse = response
        # binding.pry

        # redirect_to '/success'
      end
  end
  # def finish

    # binding.pry
    # @working_key="28177749CE3784F5BECC20C6A20DBF1B"#Put in the 32 Bit Working Key provided by CCAVENUES.   
  #     @encResponse=params[:encResp]
  #     crypto = Crypto.new 
  #     decResp=crypto.decrypt(encResponse,workingKey);
  #     decResp = decResp.split("&")
    
  # end

  def responseHandler
    # binding.pry
     @working_key="28177749CE3784F5BECC20C6A20DBF1B"#Put in the 32 Bit Working Key provided by CCAVENUES.   
      @encResponse=params[:encResp]
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
        @user[:payment_status] = true
        @user.save
      end
      # PaymentMailer.payment_user_confirmation(@user,@resultData).deliver_later
      # PaymentMailer.payment_response_confirmation(@user,@resultData).deliver_later
      ################################# 
      # @order_id = @result["order_id"]
      # @user_id = @decResp[:order_id]
  end
  # def new
  #   @payment = Payment.new
  # end
  # def index
  #   @plots = PlotSize.all
    
  # end

  private
  def user_detail
    params.require(:params).permit(:name, :email, :plot_details,:number,:payment_status,:description)
  end
  def orders
    params.require(:params).permit(:user_detail_id, :amount , :user_id)
  end
  

  
end