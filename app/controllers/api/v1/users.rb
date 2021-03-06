module API
	module V1
		class Users < Grape::API
		  include API::V1::Defaults

			resource :users do
				desc "Get current user"
				get do
					current_user.as_json	
				end

				desc "Get all users"
				get "users" do
					User.all
				end
			end
		end
	end
end
