class Counsellor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,:message => "invalid"

   def generate_password
   		password = SecureRandom.hex(3)
   		self.password = password
   		password
   end

   def send_welcome_mail password
   		CounsellorMailer.send_welcome_mail(self,password).deliver
   end	

   def full_name
   		"#{self.first_name} #{self.last_name}"
   end

   def is_master?
    p "*********#{self.inspect}******"
     if self.role == "master"
      true
     else
      false
     end 
   end 

end
