class Patient < ApplicationRecord
	
   
   has_secure_password


   validates :username,presence: true,uniqueness: true
   validates :email, presence: true,uniqueness: true

   def send_forget_password_mail
   	 generate_reset_password_token(self)
   	 PatientMailer.send_reset_password_link(self).deliver
   end	

   def generate_reset_password_token patient
   		begin
  		  reset_password_token = SecureRandom.hex
  		end while patient.class.exists?(reset_password_token: reset_password_token)
  		patient.reset_password_token = reset_password_token
  		patient.save
   end	


end
