class Patient < ApplicationRecord
	
   
   has_secure_password

   mount_uploader :profile_pic, AvatarUploader

   validates :email, presence: true,uniqueness: true
   validates :mobile, presence: true,uniqueness: true 
   validates_format_of :email,:allow_blank => true,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,:message => "format not invalid"
   validates_format_of :mobile,:allow_blank => true,:with => /\A[0-9]{10,10}\z/
   validates_format_of :pin,:allow_blank => true, :with => /\A[0-9]{6,6}\z/

   has_many :medicines, dependent: :destroy

   has_one :health_history , :inverse_of => :patient, dependent: :destroy
   accepts_nested_attributes_for :health_history, :allow_destroy => true

   has_one :nutrition_history, :inverse_of => :patient, dependent: :destroy
   accepts_nested_attributes_for :nutrition_history, :allow_destroy => true

   has_one :diabetes_history, :inverse_of => :patient, dependent: :destroy
   accepts_nested_attributes_for :diabetes_history, :allow_destroy => true

   has_many :patient_parameters
   has_many :parameters, through: :patient_parameters

   belongs_to :doctor

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
     "#{self.first_name} #{self.last_name}".titleize
   end 



  def self.search(search)
    if search.blank?
      all
    else
      where('first_name LIKE ? OR last_name LIKE ? OR concat("first_name","last_name") LIKE ?', "%#{search}%","%#{search}%","%#{search}%" )
    end
  end  

  def age
    begin
      Date.today.year - self.dob.year
    rescue
      ""
    end  
  end  

  def prefferd_time_to_call

    if !self.preferred_time_call_start.blank? and !self.preferred_time_call_end.blank? then
     return "#{self.preferred_time_call_start} to #{self.preferred_time_call_end}"
    elsif self.preferred_time_call_start.blank? or self.preferred_time_call_end.blank? then
      return "#{self.preferred_time_call_start} #{self.preferred_time_call_end}".strip
    elsif !self.preferred_time_call_start.blank? and !self.preferred_time_call_end.blank? then
      return ""
    end 

  end  


   GENDER_OPTIONS   = ["Male","Female","Other"]
   LANGUAGE_OPTIONS = ["Hindi","English","Bengali","Telugu", "Marathi", "Urdu", "Gujarati", 
    "Kannada", "Malayalam", "Punjabi", "Tamil"  ]
   BOOLEAN_OPTIONS  = [ ["Yes",1],["No",0] ]
   SOURCE_OPTIONS   = ["Dr. Anup Misra", "Dr. Sharma", "Humrahi", "DRL", "Others"]
   PACKAGE_OPTIONS  = ["Pharmacy Sales", "Pharma lite", "pharma heavy", "corporate-lite", 
    "corporate-heavy", "insurance l-te", "insurance-heavy", "Doctor-1", "Doctor-2", "Doctor-3", "Doctor-4"]
   DAY_OPTIONS = ["Sunday","Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  def self.image_data(data)
    return nil unless data
    io = CarrierStringIO.new(Base64.decode64(data))
  end


end


class CarrierStringIO < StringIO
  def original_filename
    "photo.jpeg"
  end

  def content_type
    "image/jpeg"
  end
end