class CounsellorsController < ApplicationController

	def index
		@counsellor = Counsellor.all
	end
	
	def new
		@counsellor = Counsellor.new
	end

	def create
	end	


	def counsellor_params
	end
	
		
end
