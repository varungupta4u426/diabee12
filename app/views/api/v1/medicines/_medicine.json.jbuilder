json.id medicine.id
json.name medicine.name
json.created_at medicine.created_at
json.medicine_frequency_attributes medicine.medicine_frequencies.last.each do |medicine_frequency|
	json.dosage medicine_frequency.dosage
	json.frequency_of_days medicine_frequency.frequency_of_days
	json.frequency_in_a_day medicine_frequency.frequency_in_a_day
end