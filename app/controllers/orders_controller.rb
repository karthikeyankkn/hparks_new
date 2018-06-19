class OrdersController < ApplicationController
skip_before_action :verify_authenticity_token

private
  def order
     params.require(:order).permit(:user_detail_id, :amount , :user_id)
  end	

end