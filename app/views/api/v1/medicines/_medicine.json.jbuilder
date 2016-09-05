json.dosage  medicine_frequency.dosage
json.frequency_of_days medicine_frequency.frequency_of_days
json.frequency_in_a_day medicine_frequency.frequency_in_a_day

json.medicine_frequency_times_attributes do
		json.partial! "times",collection: @medicine_frequency_time,as: :medicine_frequency_time
	end