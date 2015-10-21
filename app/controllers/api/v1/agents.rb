module API
	module V1
		class Agents < Grape::API
		  include API::V1::Defaults

			resource :agents do
				desc "Get current user agents"
				get do
					current_user.agents.as_json	
				end
			end
		end
	end
end
