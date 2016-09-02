class Api::V1::MedicinesController < AppsController
	
	before_action :authenticate_user, only: [:create,:index]
	
	def create
		@medicine = Medicine.new(patient_params)
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
	
	private 
	def patient_params
		params.require(:medicine).permit(:name,medicine_frequencies_attributes:[:dosage,:frequency_of_days,:frequency_in_a_day,medicine_frequency_times_attributes: [:medicine_time,:reminder_req] ])
	end 	
end
