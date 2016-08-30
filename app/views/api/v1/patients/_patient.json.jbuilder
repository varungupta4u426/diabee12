json.mobile patient.mobile.blank? ? "" : patient.mobile
json.email patient.email.blank? ? "" : patient.email
json.created_at patient.created_at
json.access_token patient.access_token
json.first_name patient.first_name.blank? ? "" : patient.first_name
json.last_name patient.last_name.blank? ? "" : patient.last_name
json.dob patient.dob.blank? ? "" : patient.dob
json.gender patient.gender.blank? ? "" : patient.gender  
json.street_address patient.street_address.blank? ? "" : patient.street_address
json.doctor_name patient.doctor_name.blank? ? "" : patient.doctor_name
json.nok_name patient.nok_name.blank? ? "" : patient.nok_name
json.nok_number patient.nok_number.blank? ? "" : patient.nok_number
json.profile_pic patient.profile_pic.blank? ? "" : patient.profile_pic.url
