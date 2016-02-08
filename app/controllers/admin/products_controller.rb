module Admin
  class ProductsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Product.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Product.find_by!(slug: param)
    # end
      # import products from amazon
    def import
      #ProductImportController.new.import_amazon 
      Admin::ProductsMailer.import_done_email(@user).deliver_now
      redirect_to "/admin/products" 
    end 
    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
