class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token


  def requestHandler
    # binding.pry
    @merchantData=""
    # @merchant_id="168876"
      @working_key="28177749CE3784F5BECC20C6A20DBF1B"   #Put in the 32 Bit Working Key provided by CCAVENUES.  
      @access_code="AVJW01FC55BA81WJAB"   #Put in the Access Code in quotes provided by CCAVENUES.
      params.each do |key,value|
        # binding.pry
        @merchantData += key+"="+value+"&" 
      end
      @crypto = Crypto.new
      @encrypted_data = @crypto.encrypt(@merchantData,@working_key)
      response = HTTParty.post("https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction&encRequest=#{@encrypted_data}&access_code=#{@access_code}")
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
    
  end
  def new
    @payment = Payment.new
  end
end