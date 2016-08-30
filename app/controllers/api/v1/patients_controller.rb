class Api::V1::PatientsController < AppsController

    before_action :authenticate_user, only: [:show,:update_profile]

	def create 
		@patient = Patient.new(patient_params)	
		@patient.pic = Patient.image_data(params[:patient][:profile_pic]) if params[:patient][:profile_pic].present?
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
		patient.pic = Patient.image_data(params[:patient][:profile_pic]) if params[:patient][:profile_pic].present?
		if patient == true
			render json: {result: true, messages: "Profile updated successfully",status: SUCCESS_CODE}
		else
			render_errors @patient.errors.full_messages
		end	
	end	
	

	private 
	def patient_params
		params.require(:patient).permit(:first_name, :last_name,:city, :email, :gender, :mobile, 
			:password,:doctor_name,:nok_name,:nok_number )
	end	

end
