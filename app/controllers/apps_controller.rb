class AppsController < ActionController::Base



    # before_action :authenticate_user
	helper_method :current_user

	private
	def authenticate_user
      unless logged_in?
        respond_to do |format|
          format.html { redirect_to :sign_in, alert: 'You need to login' }
          format.json { render :json => { :result => false,status: ERROR ,:message => "Patient not found!" } }
        end
      end
    end

	def find_patient(token)
      if token != nil
        @patient = Patient.find_by(:access_token => token)
      end
    end


    def logged_in?
      current_user 
    end

    def current_user
      if request.headers['Access-token'] != nil
          find_patient(request.headers['Access-token'])
      end
    end

  	def render_errors(errors)
    	render json: { errors: errors ,status: ERROR}
    end

    def generate_access_token patient
  		begin
  		  access_token = Time.now.to_i + patient.id
  		end while patient.class.exists?(access_token: access_token)
  		patient.access_token = access_token
  		patient.save
	  end
end

