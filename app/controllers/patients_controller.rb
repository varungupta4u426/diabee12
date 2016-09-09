class PatientsController < ApplicationController

  before_action :authenticate_counsellor?,:set_sidebar
  helper_method :sort_column, :sort_direction
  before_action :set_patient,only: [:edit,:update,:dashboard]

  def index
    @patients = Patient.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
    @c_tab = ""
    @p_tab = "active"
  end

  def new
    @_tab = 1
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
      redirect_to edit_patient_path(@patient,:tab=>2)
    else
      @_tab = 1
      render 'new'
    end  
  end	

  def edit
    # @patient = Patient.find(params[:id])
    @_tab = params[:tab].present? ? (params[:tab]) : 1
  end  

  def update
    # @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      @_tab = params[:tab].present? ? (params[:tab].to_i + 1) : 1 
      if @_tab >5 
        redirect_to patients_path
      else
        redirect_to edit_patient_path(@patient,:tab => @_tab)
      end  
    else
      @_tab = 1
      render 'edit'
    end
    
  end  

  def dashboard
  end  


  def sort_column
    Patient.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


  private 
  def patient_params
    if params[:patient][:dob].present? and !params[:patient][:dob].blank?
      params[:patient][:dob] = params[:patient][:dob].to_date.strftime("%F")
    end
     
	params.require(:patient).permit(:first_name,:last_name,:email,:gender,:password,:dob,
    :height,:ethnicity,:mobile,:street_address,:pin,:source,:package,:state,:city,:preferred_language,
    :preferred_time_call_start,:preferred_time_call_end,:disability,:doctor_id,
    :exercise,:smoke_drink,:reason_for_non_enrollment,:date_of_dropout,
    :reason_for_dropout,:nok_number,:nok_name, :nok_relation_with_patient,
     
     health_history_attributes: [:follow_special_diet,{:ever_had_condition=>[]},:ever_had_condition_other,:listing_special_diet,
     :dilated_eye_exam_month, :dilated_eye_exam_year, :seen_foot_doctor, :seen_foot_doctor_month,:last_dialated_eye_exam_date, 
     :seen_foot_doctor_year, :check_feet_daily, :drink_alcohol, :drinks_per_week_wine, :drinks_per_week_beer, 
     :drinks_per_week_mixed, :do_you_smoke, :smoke_packs_per_day, :smoke_years, :ever_smoke, :smoke_quit, 
     :alergies_any_othr_health_condition,:next_frequency_in_month],
     
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
  def set_sidebar
    @_sidebar = 1
  end 

  def set_patient
    @patient = Patient.includes(:health_history,:nutrition_history,:diabetes_history,:patient_parameters,:doctor).where(id: params[:id]).first
  end  

  
  	
end

    
    