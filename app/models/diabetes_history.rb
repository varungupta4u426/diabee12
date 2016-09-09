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

  def diabetes_time
      if self.diagnosed_year.blank?

         if self.diagnosed_month.blank?
            return ""
         else
            return "for 0 years #{self.diagnosed_month} months"
         end 
      else
         year = Date.today.year - self.diagnosed_year.to_i
         if self.diagnosed_month.blank?
            return "for #{year} years"
         else
            month = Date.today.month - self.diagnosed_month.to_i
            if month < 0
              year  = year -1
              month = 0 - month
            end   
            return "for #{year} years #{self.diagnosed_month} months"
         end 

      end  



  end  





end







