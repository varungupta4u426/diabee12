json.result true
json.status SUCCESS_CODE
json.object do
	json.partial! "parameter",collection: @_parameters,as: :parameter
end

