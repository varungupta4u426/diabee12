class CounsellorsController < ApplicationController
	 
	before_action :authenticate_counsellor?

	def index
		@counsellors = Counsellor.all
	end
	
	def new
		@counsellor = Counsellor.new

		p "*************#{@counsellors}*********"
	end

	def create
		@counsellor = Counsellor.new(counsellor_params)
		@counsellor.role = "junior"
		password = @counsellor.generate_password
		
		if @counsellor.save
			@counsellor.send_welcome_mail(password)
			redirect_to "/counsellors"
		else
			render 'new'
		end	
	end	

	def edit
		@counsellor =Counsellor.find(params[:id])
	end	

	def update

		@counsellor = Counsellor.find(params[:id])

		if @counsellor.update(counsellor_params)
			redirect_to "/counsellors"
		else
			render 'edit'
		end	
	end	

	def show
		@counsellor = Counsellor.find(params[:id])
	end	


	def counsellor_params
		params.require(:counsellor).permit(:first_name, :last_name, :email, :profile, :hcah_landline, :mobile)
	end
	
end
