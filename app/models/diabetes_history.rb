class DiabetesHistory < ApplicationRecord
  belongs_to :patient

  DIABETES_TYPE   = ["Gestational","Type 1","Type 2","Pre-Diabetes","Don't know"]
  EDUCATION_SESSION_OPTIONS = [
							  	"Healthy Eating",
								"Impact of Physical Activity",
								"Using Medications",
								"Checking My Blood Sugar",
								"Behavior Change Strategies",
								"Lowering My Risk for Complications",
								"Coping Skills"
  							  ]
  TEST_OPTIONS = [
  					"Before Breakfast",
  					"Before Lunch",
  					"Before Dinner",
  					"Bedtime",
  					"2 hours after Breakfast",
  					"2 hours after Lunch",
  					"2 hours after Dinner"
  				]  			

  LOW_BLOOD_SUGAR = ["Never","Once","Two or more times/week","Bedtime"]        				  

end







