Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


		  namespace :api do
		      api_version(
		          module: "V1",
		          header: { name: "Accept", value: "application/vnd.hcare+json; version=1" },
		          defaults: { format: :json }
		        ) do
		          
		          resource :patients, only: [:create]
		    end
		  end 
end


