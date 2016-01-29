class AlertsController < ApplicationController
  def create
    if session[:user_id]
      alert = Alert.new
      alert.user_id = session[:user_id]
      alert.content = params[:alertKw]
      alert.save
      
      respond_to do |format|
        format.json {render :json => {alerts: Alert.where(user_id: session[:user_id]).all,
				      text: "alert added",
                                      status: :success}
                    }
      end
    else
      # error handling. not logged in
    end
  end

  def get
  end

  def delete
    if session[:user_id]
      alert = Alert.find(params[:id])
      alert.delete
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: {alerts: Alert.where(user_id: session[:user_id]).all}}
      end
    else
      # error handling
    end

  end
end
