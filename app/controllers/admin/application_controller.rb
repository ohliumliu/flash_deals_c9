# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin

    def authenticate_admin
      # TODO Add authentication logic here.
      if session[:user_id].nil?
        flash[:error] = "please login first"
        redirect_to root_path
      elsif 
        @user = User.find(session[:user_id])
        if !@user.isadmin
          flash[:error] = "you are not admin"
          redirect_to root_path
        end
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
