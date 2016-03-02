class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_lists
  
  def initialize_lists
    @merchants = Merchant.all
    @catalogs = Catalog.all
    @travel_sites = TravelSite.all
    @dealers = Dealer.all
    @dealer_id = 1 unless @dealer_id = params[:dealer_id] 
    if @user_id = session[:user_id]
      @user_name = User.find(@user_id).name
      @user_alerts = Alert.where(:user_id => @user_id).all
    end
  end
  
 
end
