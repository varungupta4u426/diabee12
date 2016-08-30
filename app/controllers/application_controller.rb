class ApplicationController < ActionController::Base
  protect_from_forgery  with: :null_session

  
  def cities
  	render json: CS.cities(params[:state], :in).to_json
  end

  def after_sign_in_path_for(resource)
  	 patients_path
  end
  
  def after_sign_out_path_for(resource)
  	 root_path
  end	

  def authenticate_counsellor?
    unless counsellor_signed_in?
      redirect_to root_path
    end  
  end  


end
