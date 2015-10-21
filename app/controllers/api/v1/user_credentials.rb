module API
	module V1
		class UserCredentials < Grape::API
		  include API::V1::Defaults

			resource :user_credentials do
				desc "Get current user credentials"
				get do
					current_user.user_credentials.as_json	
				end
			end
		end
	end
end
