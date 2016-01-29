class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_lists
  
  def initialize_lists
    @merchants = Merchant.all
    @catalogs = Catalog.all
    @travel_sites = TravelSite.all
  end

end
