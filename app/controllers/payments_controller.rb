class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token

  def requestHandler
    # binding.pry
    # @user_details = UserDetail.new(user_detail)
    # if @plot_details.save
    #   binding.pry
    #   render @plot_details
    #   id = @plot_details.id
    # else
    #   binding.pry
    # end
    # order_id = params[:order_id]
    # binding.pry

    @merchantData="order_id=#{params[:order_id]}&merchant_id=168876&amount=20000&currency=INR&redirect_url=http://hparks.getspini.in/transaction/ccavResponseHandler&cancel_url=http://hparks.getspini.in/transaction/ccavResponseHandler&language=EN"
    # @merchant_id="168876"
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
      @result = Object.new
      @decResp.each do |key|
        @result["#{key.from(0).to(key.index("=")-1)}"] = "#{key.from(key.index("=")+1).to(-1)}"
      end
      @order_id = @result["order_id"]
      # @user_id = @decResp[:order_id]
  end
  def new
    @payment = Payment.new
  end
  def index
    @plots = PlotSize.all
    
  end

  private
  def user_detail
    params.require(:params).permit(:name, :email, :plot_details,:number,:payment_status,:description)
  end
  

  
end