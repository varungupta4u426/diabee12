class ApplicationController < ActionController::Base
  protect_from_forgery  with: :null_session

  def cities
  	render json: CS.cities(params[:state], :in).to_json
  end


end
