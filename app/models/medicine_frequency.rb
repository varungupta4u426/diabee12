class MedicineFrequency < ApplicationRecord
  belongs_to :medicine
  has_many :medicine_frequency_times, dependent: :destroy
  accepts_nested_attributes_for :medicine_frequency_times, :allow_destroy => true


  def total_taken
    count = self.frequency_in_a_day
  	rand(0..count)
  end
  

end
