class CounsellorMailer < ApplicationMailer

	def send_welcome_mail(counsellor,password)
		@counsellor = counsellor
		@password = password
    	mail(:to => counsellor.email, :subject => "Welcome Mail",:from => "support@diabee.com")
	end

end
