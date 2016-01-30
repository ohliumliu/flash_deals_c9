class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_lists
  
  def initialize_lists
    @merchants = Merchant.all
    @catalogs = Catalog.all
    @travel_sites = TravelSite.all
    if @user_id = session[:user_id]
      @user_name = User.find(@user_id).name
    end
  end

end
