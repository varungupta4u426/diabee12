class Patient < ApplicationRecord
	
   
   has_secure_password

   mount_uploader :profile_pic, AvatarUploader

   # validates :email, presence: true,uniqueness: true
   # validates :mobile, presence: true,uniqueness: true 

   has_one :health_history , :inverse_of => :patient, dependent: :destroy
   accepts_nested_attributes_for :health_history, :allow_destroy => true

   has_one :nutrition_history, :inverse_of => :patient, dependent: :destroy
   accepts_nested_attributes_for :nutrition_history, :allow_destroy => true

   has_one :diabetes_history, :inverse_of => :patient, dependent: :destroy
   accepts_nested_attributes_for :diabetes_history, :allow_destroy => true

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

   def full_name
     "#{self.first_name} #{self.last_name}"
   end 

   GENDER_OPTIONS   = ["Male","Female","Other"]
   LANGUAGE_OPTIONS = ["Hindi","English"]
   BOOLEAN_OPTIONS  = [ ["Yes",1],["No",0] ]
   SOURCE_OPTIONS   = ["Dr. Anup Misra", "Dr. Sharma", "Humrahi", "DRL", "Others"]
   PACKAGE_OPTIONS  = ["Pharma-sales", "Pharma – Lite", "Pharma-Heavy", "Corporate-Lite",
     "Corporate-Heavy", "Doctor-1", "Doctor-2", "Doctor-3", "Doctor-4"]

end
