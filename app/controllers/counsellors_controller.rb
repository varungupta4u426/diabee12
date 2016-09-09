class CounsellorsController < ApplicationController
	 
	before_action :authenticate_counsellor?, :set_sidebar

	def index
		@counsellors = Counsellor.paginate(:page => params[:page], :per_page => 10)
		@c_tab = "active"
		@p_tab = ""
	end
	
	def new
		@counsellor = Counsellor.new
	end

	def create
		@counsellor = Counsellor.new(counsellor_params)
		@counsellor.role = "junior"
		password = @counsellor.generate_password
		
		if @counsellor.save
			@counsellor.send_welcome_mail(password)
			redirect_to "/counsellors/#{@counsellor.id}",:notice => "Counsellor Added Successfully."
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
			redirect_to "/counsellors/#{@counsellor.id}",:notice => "Counsellor Details Updated Successfully."
		else
			render 'edit'
		end	
	end	

	def show
		@counsellor = Counsellor.find(params[:id])
	end	

	private
	def counsellor_params
		params.require(:counsellor).permit(:first_name, :last_name,:profile_pic, :email, :profile, :hcah_landline, :mobile)
	end

	def set_sidebar
		@_sidebar = 2
	end	
	
end
