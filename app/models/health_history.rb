class HealthHistory < ApplicationRecord
  belongs_to :patient


  EVER_HAD_CONDITION = 	[	
  						"Heart Problems",
							"Cancer",
							"Sleep Apnea",
							"Thyroid Problems",
							"Stroke",
							"Kideny Disease",
							"Breathing Problems",
							"Gestational Diabetes",
							"High Cholesterol",
							"Foot Problems",
							"Cataracts / Glaucoma",
							"PCOS",
							"High Blood Pressure",
							"Pain issues",
							"Sexual Dysfunction",
							"Other",
							"Circulation Problems",
							"Stomach or intestinal Problems",
							"Depression or Mental Illness",
							]
  def last_eye_exam_date
  	if self.last_dialated_eye_exam_date.blank?
  		return ""
  	else
  		return "#{self.last_dialated_eye_exam_date.strftime("%d/%m/%Y")}"
  	end	
  end

  def next_frequency
  	if self.last_dialated_eye_exam_date.blank? or self.next_frequency_in_month.blank?
  		return ""
  	else
  		next_date = self.last_dialated_eye_exam_date + self.next_frequency_in_month.to_i.months
  		return "#{next_date.strftime("%d/%m/%Y")}"
  	end
  end
  	
  def co_morbidities
  if self.ever_had_condition.nil? or self.ever_had_condition.blank?
  	return nil
  else	 
  	self.ever_had_condition.delete('"][').split(",") << self.ever_had_condition_other
  end
  end


end  	


