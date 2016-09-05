class PatientsController < ApplicationController

  before_action :authenticate_counsellor?


  def index
    @patients = Patient.all.order('id desc')
  end

  def new
  	@patient = Patient.new
  	@patient.build_health_history
    nutrition = @patient.build_nutrition_history
    nutrition.exercises.build
    @patient.build_diabetes_history
  end

  def create
  	@patient = Patient.new(patient_params)
    @patient.password = "12345" 
  	if @patient.save
      redirect_to root_path
    else
      render 'new'
    end  
  end	

  def edit
    @patient = Patient.find(params[:id])
  end  

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to root_path
    else
      render 'edit'
    end
    
  end  



  private 
  def patient_params
	params.require(:patient).permit(:first_name,:last_name,:email,:gender,:password,:dob,
    :height,:ethnicity,:mobile,:street_address,:pin,:source,:package,:state,:city,:preferred_language,
    :preferred_time_call_start,:preferred_time_call_end,:disability,
    :exercise,:smoke_drink,:reason_for_non_enrollment,:date_of_dropout,
    :reason_for_dropout,:nok_number,:nok_name, :nok_relation_with_patient,
     
     health_history_attributes: [:follow_special_diet,{:ever_had_condition=>[]}, :listing_special_diet,
     :dilated_eye_exam_month, :dilated_eye_exam_year, :seen_foot_doctor, :seen_foot_doctor_month, 
     :seen_foot_doctor_year, :check_feet_daily, :drink_alcohol, :drinks_per_week_wine, :drinks_per_week_beer, 
     :drinks_per_week_mixed, :do_you_smoke, :smoke_packs_per_day, :smoke_years, :ever_smoke, :smoke_quit, 
     :alergies_any_othr_health_condition],
     
     nutrition_history_attributes: [:weight,:height,:weight_chamge_last_year,:realistic_weight_for_you, 
    :since_you_at_that_weight, :confidence_diaterey_change, :motivation_diatery_change, :eat_out_for_breakfast_count, 
    :eat_out_for_lunch_count, :eat_out_for_dinner_count, {places_eat_ot_at:[]},:type_of_bevrages_drink_a_day, 
    :eat_regular_meal, :eat_regular_meal_comment, :take_vitamin_mineral_diet_supplement, 
    :take_vitamin_mineral_diet_supplement_type,:do_you_exercise_now,exercises_attributes: [:type_of_exercise,:amount_of_time,:times_per_weak,:_destroy] ],
    
     diabetes_history_attributes:[:diabetes_type, :diagnosed_month, :diagnosed_year, :any_one_in_family_have_diabetes,
    :whome_have_diabetes_family, :previous_diabetes_education, :own_words_diabetes, {intersting_learning_diabetes_session:[]}, 
    :test_blood_sugar_at_home, :what_meter_use, :how_often_test_sugar, :how_often_test_sugar_other, {when_did_you_test:[]}, 
    :when_did_you_test_other, {last_month_low_blood_sugar:[]}, :what_you_do_when_sugar_high, :what_you_do_when_sugar_low, 
    :emergency_room_for_diabets_related_event] )
  
  end	
  	
end

    
    