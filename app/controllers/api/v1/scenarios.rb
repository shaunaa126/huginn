module API
	module V1
		class Scenarios < Grape::API
		  include API::V1::Defaults

			resource :scenarios do
				desc "Get current user scenarios"
				get do
					current_user.scenarios.as_json	
				end
			end
		end
	end
end
