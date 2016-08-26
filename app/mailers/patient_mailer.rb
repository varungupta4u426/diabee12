class PatientMailer < ApplicationMailer

	def send_reset_password_link(patient)
		@patient = patient
    	mail(:to => patient.email, :subject => "password reset instructins",:from => "support@diabee.com")
	end
		
end
