class Medicine < ApplicationRecord
  belongs_to :patient
  has_many :medicine_frequencies, dependent: :destroy
  accepts_nested_attributes_for :medicine_frequencies, :allow_destroy => true
end
