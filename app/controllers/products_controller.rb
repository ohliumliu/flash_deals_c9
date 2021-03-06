class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  def count
    respond_to do |format|
      format.json {render json: {count: Product.all.count}}
    end
  end
  
  # import products from amazon
  def import
    ProductImportController.new.import_amazon 
    redirect_to "/admin/products" 
  end
  
  # save click history
  def product_click
    
    # check if the product is already in products_cluster
    id = params[:id].to_i # should be from params
    uid = params[:uid].to_i # should be from params
    if ProductCluster.exists?(product_id: id)
      # pass
    else
    # save product info to trigger streaming
      @product = Product.find(id)
      @product.save_for_kmeans()
    end
    
    # save click_history
    ch = ClickHistory.new()
    ch.user_id = uid
    ch.product_id = id
    ch.save!()
    
    respond_to do |format|
       format.json {render json: {result: 'ok'}}
    end
  end
end
