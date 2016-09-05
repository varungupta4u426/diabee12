json.result true
json.status SUCCESS_CODE
json.medicine do
	json.id @medicine.id
	json.name @medicine.name
	
	json.medicine_frequencies_attributes do
		json.partial! "medicine",collection: @medicine_frequencies,as: :medicine_frequency
	end

end

