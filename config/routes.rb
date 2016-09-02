Rails.application.routes.draw do

   # devise_for :counsellors
   

   	devise_for :counsellors, controllers: {
        sessions: 'counsellor/sessions',
        passwords: 'counsellor/passwords'
      }

	 devise_scope :counsellor do
	  root :to => 'counsellor/sessions#new'
	end   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


		  namespace :api do
		      api_version(
		          module: "V1",
		          header: { name: "Accept", value: "application/vnd.hcare+json; version=1" },
		          defaults: { format: :json }
		        ) do
		          
		          resource :patients, only: [:create,:show] do 
		          	collection do
					   post 'update_profile'
					end
				  end

		          resource :sessions, only: [:create] do 
		          	collection do
					   post 'logout'
					end
				  end
		          resource :passwords,only: [:edit]	
		          resources :medicines,only: [:create,:index]
		          resources :blog_posts,only: [:index]
		    end
		  end 

		get  'patient/password/new'   , :to => "api/v1/passwords#new"
		post 'patient/password/create', :to => "api/v1/passwords#create"

		get 'cities/:state', to: 'application#cities'

		
		
		resources :patients  
		resources :counsellors, only: [:new,:index,:edit,:update,:show] do
			collection do
			   post 'create'
			end
		end	



end


