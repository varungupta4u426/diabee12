class PatientsController < ApplicationController
  def index
  	@patients = Patient.all
  end

  def new
  	@patient = Patient.new
  	@patient.build_health_history
    nutrition = @patient.build_nutrition_history
    nutrition.exercises.build
  end

  def create
  	p "***********#{params.inspect}******"

  	@patient = Patient.new(patient_params)
  	@patient.save

  	p "*********#{@patient.errors.messages}*********"
  end	



  private 
  def patient_params
	params.require(:patient).permit(:first_name,:last_name,:email,:gender,:password,:dob,
    :height,:ethnicity,:mobile,:street_address,:pin,:state,:city,:preferred_language,
    :preferred_time_call_start,:preferred_time_call_end,:disability,
    :exercise,:smoke_drink,:reason_for_non_enrollment,:date_of_dropout,
    :reason_for_dropout,:nok_number,:nok_name, :nok_relation_with_patient,
     health_history_attributes: [:listing_special_diet],
     nutrition_history_attributes: [:weight, :eat_out_place_ids,exercises_attributes: [:type_of_exercise] ] )
  end	
  	
end


