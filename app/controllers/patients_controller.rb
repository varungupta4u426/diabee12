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
     health_history_attributes: [:listing_special_diet,ever_had_condition:[]],
     nutrition_history_attributes: [:weight, places_eat_ot_at:[],exercises_attributes: [:type_of_exercise] ],
     diabetes_history_attributes:[:type, :diagnosed_month, :diagnosed_year, :any_one_in_family_have_diabetes,
    :whome_have_diabetes_family, :previous_diabetes_education, :own_words_diabetes, :intersting_learning_diabetes_session, 
    :test_blood_sugar_at_home, :what_meter_use, :how_often_test_sugar, :how_often_test_sugar_other, :when_did_you_test, 
    :when_did_you_test_other, :last_month_low_blood_sugar, :what_you_do_when_sugar_high, :what_you_do_when_sugar_low, 
    :emergency_room_for_diabets_related_event] )
  
  end	
  	
end


       