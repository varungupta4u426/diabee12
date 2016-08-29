Rails.application.routes.draw do

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
		    end
		  end 

		get  'patient/password/new'   , :to => "api/v1/passwords#new"
		post 'patient/password/create', :to => "api/v1/passwords#create"

		get 'cities/:state', to: 'application#cities'

		root 'patients#index'
		
		resources :patients  

end


