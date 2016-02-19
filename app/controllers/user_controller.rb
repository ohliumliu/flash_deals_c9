class UserController < ApplicationController
  require 'sendMailgun'
  def signup
    if @user.nil? 
      @user = User.new
    end
  end


  def edit
    if session[:user_id].nil?
      flash[:error] = "please log in first"
      redirect_to root_path
    else
      @user = User.find(session[:user_id])
      @user_id = session[:user_id]
      respond_to do |format|
        format.html {render "_edit"}
      end
    end
  end
  
  def update
    @user = User.find(session[:user_id])
    if params[:user][:password] == params[:user][:passwordRepeat]
      @user[:password] = Digest::SHA1.hexdigest params[:user][:password]
      #@user[:password_confirmation] = Digest::SHA1.hexdigest params[:passwordRepeat]
      @user[:email] = params[:user][:email]
      if @user.save 
        flash[:success] = "Thank you for updating"
      end
    else
      @user.errors.add(:password, "not the same")  
      #flash[:error] = "password not the same"
    end
      render "/user/_edit"

    
  end
  
  
  
  def create
    @user = User.new
    if params[:password] == params[:passwordRepeat]
      @user[:name] = params[:username]
      @user[:password] = Digest::SHA1.hexdigest params[:password]
      #@user[:password_confirmation] = Digest::SHA1.hexdigest params[:passwordRepeat]
      @user[:email] = params[:email]
      if @user.save 
        flash[:success] = "Thank you for registration"
        #SendMailgun.new.send_simple_message
        UserMailer.welcome_email(@user).deliver_later
        #render "/user/after_signup"
      end
    else
      @user.errors.add(:password, "not the same")  
      #flash[:error] = "password not the same"
    end
    render "/user/signup"
    # redirect_to doesn't carry flash or errors message. render can. But render cannot
    # update csrf-token in head!! this is fixed by adding csrf-token field in formhow to use session to transfer variables
    
    #@products = Product.order('percentage_saved DESC').page 1 
    #render "/show/show" 
  end

  def signin
    @products = Product.all
    if (@user = User.where(:name => params[:username]).first) && (Digest::SHA1.hexdigest(params[:password]) == @user.password)
      session[:user_id] = @user.id
      #flash[:success] = session[:user_id] 
      user_alerts = Alert.where(user_id: session[:user_id]).all
      respond_to do |format|
        format.html
        format.json {render :json => {user: @user, alerts: user_alerts, status: :signin, token: session[:_csrf_token]}}
      end

    else
      respond_to do |format|
        format.html
        format.json {render :json => {status: :fail}}
      end
      #redirect_to action: "signup", :flash => {:error => "I don't know you"} 
    end
       
  end

  def signout
    if session[:user_id]
      session[:user_id] = nil
    end
    redirect_to root_path
  end
end
