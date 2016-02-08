class Admin::ProductsMailer < ApplicationMailer
    def import_done_email(user)
      debugger
      @products = Product.all
      mail(to: user.email, subject: 'Product Import is Done')
    end
end
