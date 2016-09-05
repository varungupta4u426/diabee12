class MedicineFrequency < ApplicationRecord
  belongs_to :medicine
  has_many :medicine_frequency_times, dependent: :destroy
  accepts_nested_attributes_for :medicine_frequency_times, :allow_destroy => true


  def total_taken
  	total1 = self.frequency_of_days.to_i + self.frequency_in_a_day.to_i
  	total2 = self.frequency_of_days.to_i * self.frequency_in_a_day.to_i
  	if total1 > total2
  		total = total1/2
  	else
  		total = total1
  	end
  	total
  end
  

end
