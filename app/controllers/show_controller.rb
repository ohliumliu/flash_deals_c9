class ShowController < ApplicationController
  def show
    if params[:catalog_id]
      @products = Product.where(catalog_id: params[:catalog_id]).order('percentage_saved DESC')
      @products = @products.where(dealer_id: params[:dealer_id])
      @products = @products.page params[:page]
      # this last command gets the products from :page
      respond_to do |format|
        format.js
      end
    elsif params[:dealer_id]
      debugger
      @dealer_id = params[:dealer_id]
      session[:dealer_id] = params[:dealer_id]
      @products = Product.where(dealer_id: params[:dealer_id]).order('percentage_saved DESC')
      @products = @products.page params[:page]
      # this last command gets the products from :page
      respond_to do |format|
        format.js
        format.html
      end
    elsif params[:merchant_id]
      @products = Product.where(merchant_id: params[:merchant_id]).order('percentage_saved DESC').page params[:page]
      respond_to do |format|
        format.html {render :partial => "show" }
      end
    elsif params[:search]
      @products = Product.where('title LIKE ?', "%#{params[:search]}%")
      debugger
      if session[:dealer_id] 
        @products = @products.where(dealer_id: session[:dealer_id])
      end
      @products = @products.page params[:page]
      respond_to do |format|
        format.html {render partial: "show"} # index.html.erb
        #format.html {render :partial => "show", :locals => {:products => @products}} # index.html.erb
        #format.html {render partial: "show", locals: {products: @products}}# index.html.erb
        #format.html {render partial: "show", object: @products}# index.html.erb
      end
    else
      @products = Product.order('percentage_saved DESC').page params[:page]
      @dealer_id = nil
      session[:dealer_id] = nil
    end
  end

  def list_catalogs
    @catalogs = Catalog.all
  end

  def list_merchants
    @merchants = Merchant.all
  end

end
