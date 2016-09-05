class Api::V1::MedicinesController < AppsController
	
	before_action :authenticate_user, only: [:create,:index]
	
	def create
		@medicine = Medicine.new(medicine_params)
		@medicine.patient_id = @patient.id
		if @medicine.save
			render json: {result: true, status: SUCCESS_CODE, messages: "Medicine added succeefully"}
		else
			render_errors @medicine.errors.full_messages
		end	
	end

	def index
		@medicines = Medicine.includes(:medicine_frequencies).where(:patient_id=>@patient.id).map{|medicine| medicine.as_json(only: [:id,:name]).merge!(:dosage=>medicine.medicine_frequencies.last.dosage)}
	end	

	def  show
		@medicine = Medicine.find_by(:id => params[:id])
		@medicine_frequencies = [@medicine.medicine_frequencies.last]
		@medicine_frequency_time = @medicine.medicine_frequencies.last.medicine_frequency_times
	end	

	def update_medicine
		
		@medicine = Medicine.find_by(params[:medicine_id])

		# p "====medicine=========#{@medicine.inspect}======="

		@last_frequency = @medicine.medicine_frequencies.last

		# p "====last_frequency=========#{@last_frequency.inspect}===///==#{params.inspect}=="

		medicine = params[:medicine]
		# p "*****1******#{medicine.inspect}******"
		medicine_frequency =  params[:medicine][:medicine_frequencies_attributes][0].permit!
		 # p "******2*****#{medicine_frequency.permit!.inspect}******"
		dosage = params[:medicine][:medicine_frequencies_attributes][0][:dosage]
		# p "*****3******#{dosage.inspect}******"
		frequency_of_days = params[:medicine][:medicine_frequencies_attributes][0][:frequency_of_days].to_i
		frequency_in_a_day = params[:medicine][:medicine_frequencies_attributes][0][:frequency_in_a_day].to_i

		# p "==medicine=====#{medicine.inspect}=====////==medicine_frequency======#{medicine_frequency.inspect}========="

		# p "=dosage==#{dosage}==///===fdays==#{frequency_of_days}===///==inaday====#{frequency_in_a_day}=========="

		medicine_time = params[:medicine][:medicine_frequencies_attributes][0][:medicine_frequency_times_attributes]
		# p "==========#{medicine_time.inspect}=============="
		if @last_frequency.created_at.to_date == Date.today
			#p "**************inside**"
			if @last_frequency.frequency_in_a_day ==  frequency_in_a_day.to_i
				# p "*******inside********"
				  @last_frequency.medicine_frequency_times.destroy_all
				  @last_frequency.update(medicine_frequency)
				  render json: {result: true, status: SUCCESS_CODE, messages: "Medicine updated succeefully"}
			else
				# p "*****outside*****"
				  @last_frequency.medicine_frequency_times.destroy_all
				  @last_frequency.update(medicine_frequency)
				  render json: {result: true, status: SUCCESS_CODE, messages: "Medicine updated succeefully"}
			end	

		else
			if @last_frequency.dosage == dosage and  @last_frequency.frequency_of_days == frequency_of_days and @last_frequency.frequency_in_a_day == frequency_in_a_day
				#p "*********************"
				@last_frequency.medicine_frequency_times.destroy_all
				@last_frequency.update(medicine_frequency)
				render json: {result: true, status: SUCCESS_CODE, messages: "Medicine updated succeefully"}
			else
				#p "============="
				@medicine.medicine_frequencies.create(medicine_frequency)
				render json: {result: true, status: SUCCESS_CODE, messages: "Medicine updated succeefully"}
			end	
		end 

	end

	def get_graph
		medicine = Medicine.includes(:medicine_frequencies).where(id: params[:medicine_id]).first
		@medicine = []
		medicine.medicine_frequencies.group_by(&:created_at).each do |m|
		    key = m[0]
		    count = m[1][0]["frequency_of_days"].to_i + m[1][0]["frequency_in_a_day"].to_i
		    value = m[1][0].as_json.merge("total_taken"=>count)
		    hash = {key => value}
		    @medicine << hash
		end
		render json: {result: true, status: SUCCESS_CODE, messages: "Graph fetched succeefully", graph: @medicine}
	end	

	
	private 
	# def frequency_params
	# 	params[:medicine][:medicine_frequencies_attributes][0].require
	# end	
	def medicine_params
		params.require(:medicine).permit(:name,medicine_frequencies_attributes:[:dosage,:frequency_of_days,:frequency_in_a_day,medicine_frequency_times_attributes: [:medicine_time,:reminder_req] ])
	end 	
end



