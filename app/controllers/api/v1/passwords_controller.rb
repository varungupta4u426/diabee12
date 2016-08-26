class Api::V1::PasswordsController < ApplicationController


	def create 
		@patient = Patient.find_by(:email => params[:email])
		@patient.send_forget_password_mail
	end
		
end
