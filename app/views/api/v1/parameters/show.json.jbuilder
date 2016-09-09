json.result true
json.status SUCCESS_CODE
json.name @_parameter_name
json.object do
	json.partial! "parameter",collection: @_parameters,as: :parameter
end

