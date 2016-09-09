class Api::V1::ParametersController < AppsController
	before_action :authenticate_user, only: [:create,:show]
	

	def create 
		@parameter = Parameter.find_by_name(params[:parameter][:name]) 
		@_parameter = @patient.patient_parameters.new(parameter_params)
		@_parameter.parameter_id = @parameter.id

		if @_parameter.save
			render json: {result: true, messages: "Parameter saved successfully",status: SUCCESS_CODE}
		else
			render_errors @_parameter.errors.full_messages
		end
	end

	def show	
		@_parameter_name = params[:name]
		@_parameters = PatientParameter.joins("INNER JOIN parameters ON parameters.name = '#{@_parameter_name}' 
			AND patient_parameters.patient_id = '#{@patient.id}' ").
		select("patient_parameters.id,patient_parameters.part_of_day,patient_parameters.time,patient_parameters.reading,
			patient_parameters.date_of_recall").order("date_of_recall ASC")
			
	end	


	

	private	
	def parameter_params
		params.require(:parameter).permit(:part_of_day,:time,:reading,:date_of_recall)
	end	
end



