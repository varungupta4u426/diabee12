class Api::V1::SessionsController < AppsController
   	
   	before_action :authenticate_user, only: [:logout]


	def create
		@patient = Patient.find_by(:mobile => params[:mobile])
		if @patient && @patient.authenticate(params[:password])
			generate_access_token @patient
			render :create
		else
			error = ["Mobile no. OR Password is invalid!! Please try again"]
			render_errors error
		end	
	end	

	def logout
		sign_out
		render json: {result: true, messages: "Logged out successfully",status: SUCCESS_CODE}
	end	
 	
 	private
 	def sign_out
 		@patient.access_token = nil
 		@patient.save
 	end	
end


