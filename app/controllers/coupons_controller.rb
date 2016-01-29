class CouponsController < ApplicationController
  def submit_deal
    deal = Coupon.new
    deal[:content] = params[:submitDeal]
    deal.save

    respond_to do |format|
      format.html # index.html.erb
      format.text { render text: "Thank you for submitting a deal" }
    end
  end

  def delete_deal
    deal = Coupon.find(params[:id])
    deal.delete
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: {alerts: Coupon.all}}
    end
  end
end
