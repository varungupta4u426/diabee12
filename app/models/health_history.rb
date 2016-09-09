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
  end

  public
  def co_morbidities
  	if self.ever_had_condition.nil? or self.ever_had_condition.blank?
  		return nil
  	else	 
  		self.ever_had_condition.delete('"][').split(",") << self.ever_had_condition_other
  	end	
  end	


