class Api::V1::PatientsController < AppsController

    # before_action :authenticate_user#, only: []

	def create 
		@patient = Patient.new(patient_params)		
		if @patient.save
			generate_access_token @patient
			render :create
		else
			render_errors @patient.errors.full_messages
		end	
	end
	

	private 
	def patient_params
		params.require(:patient).permit(
				:first_name,
				:last_name,
				:email,
				:gender,
				:mobile,
				:password
			)
	end	



end
