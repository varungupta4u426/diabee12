class Api::V1::SessionsController < AppsController
   	
   	before_action :authenticate_user, only: [:destroy]


	def create
		@patient = Patient.find_by(:mobile => params[:mobile])
		if @patient && @patient.authenticate(params[:password])
			generate_access_token @patient
			render :create
		else
			render_errors "Invalid Credentials"
		end	
	end	

	def destroy
		sign_out
		render json: {result: true, messages: "Logged out successfully",status: 200}
	end	
 	
 	private
 	def sign_out
 		@patient.access_token = nil
 		@patient.save
 	end	
end



