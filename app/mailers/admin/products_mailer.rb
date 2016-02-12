class Admin::ProductsMailer < ApplicationMailer
    def import_done_email(user)
      @products = Product.all
      mail(to: user.email, subject: 'Product Import is Done')
    end
   
    def import_error_email(user, e)
      @error = e 
      mail(to: user.email, subject: 'Product Import has an error')
    end
    
end
