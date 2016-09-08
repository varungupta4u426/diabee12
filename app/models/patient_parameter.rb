class PatientParameter < ApplicationRecord
  belongs_to :patient
  belongs_to :parameter
end
