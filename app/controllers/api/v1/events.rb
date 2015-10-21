module API
	module V1
		class Events < Grape::API
		  include API::V1::Defaults

			resource :events do
				desc "Get current user events"
				get do
					current_user.events.as_json	
				end
			end
		end
	end
end
