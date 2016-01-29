class HomepageController < ApplicationController
  def index
    @products = Product.order('percentage_saved DESC').page(params[:page]).per(5)
  end
end
