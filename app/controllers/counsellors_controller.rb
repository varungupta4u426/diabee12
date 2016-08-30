class CounsellorsController < ApplicationController
	 
	before_action :authenticate_counsellor?

	def index
		@counsellor = Counsellor.all
	end
	
	def new
		@counsellor = Counsellor.new
	end

	def create
		@counsellor = Counsellor.new(counsellor_params)

		password = SecureRandom.hex(3)
		
		@counsellor.password = password
		
		if @counsellor.save
			redirect_to counsellors_path
		else
			render 'new'
		end	
	end	


	def counsellor_params
		params.require(:counsellor).permit(:first_name, :last_name, :email, :profile, :hcah_landline, :mobile)
	end
	
end
