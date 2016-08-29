json.result true
json.status SUCCESS_CODE
json.patient do
	json.partial! "patient",patient: @patient
end