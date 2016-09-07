class Api::V1::PatientsController < AppsController

    before_action :authenticate_user, only: [:show,:update_profile]

	def create 
		@patient = Patient.new(patient_params)	
		@patient.pic = Patient.image_data(params[:patient][:profile_pic]) if params[:patient][:profile_pic].present?
		@patient.build_health_history
		@patient.build_nutrition_history
		@patient.build_diabetes_history
		if @patient.save
			generate_access_token @patient
			render :create
		else
			render_errors @patient.errors.full_messages
		end	
	end

	def show
	end 

	def update_profile

		patient = @patient.update(patient_params)

		if patient == true
			profile_pic = patient.profile_pic.blank? "" : patient.profile_pic.url
			render json: {result: true, messages: "Profile updated successfully",status: SUCCESS_CODE,profile_pic: profile_pic }
		else
			render_errors @patient.errors.full_messages
		end	
	end	
	

	private 
	def patient_params
		params[:patient][:profile_pic] = Patient.image_data(params[:patient][:profile_pic]) if params[:patient][:profile_pic].present? 
		params.require(:patient).permit(:first_name, :last_name,:city,:dob, :email, :gender, :mobile, 
			:password,:doctor_name,:nok_name,:nok_number,:profile_pic,:street_address )
	end	

end
