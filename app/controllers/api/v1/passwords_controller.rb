class Api::V1::PasswordsController < AppsController

    layout false
	
	def new
	  	@patient = Patient.find_by_reset_password_token(params[:token])
	end

	def edit 
		@patient = Patient.find_by(:email => params[:email])
		if @patient
		   @patient.send_forget_password_mail
		   render json: {result: true, status: 200, messages: "Reset password instructions sent to your mail"}
		else
		   render_errors "Email address not registered"
		end   
	end	
		
	def create 	
		@patient = Patient.find_by_reset_password_token(params[:token])
		@patient.update_attributes(:password=>params[:password])
	end	
end
