class CounsellorsController < ApplicationController

	def index
		@counsellor = Counsellor.all
	end
	
	def new
		@counsellor = Counsellor.new
	end

	def create
		@counsellor = Counsellor.new(counsellor_params)

		if @counsellor.save
		else
		end	
	end	


	def counsellor_params
		params.require(:counsellor).permit(:first_name, :last_name, :email, :profile, :hcah_landline, :mobile)
	end
	
end
