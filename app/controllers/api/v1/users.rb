module API
	module V1
		class Users < Grape::API
		  include API::V1::Defaults

			resource :users do
				desc "Get current user"
				get do
					current_user.as_json	
				end
			end
		end
	end
end
