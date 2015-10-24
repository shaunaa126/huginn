module API
	module V1
		class Agents < Grape::API
		  include API::V1::Defaults

			resource :agents do
				desc "Get current user agents"
				get do
					current_user.agents.as_json	
				end
			
			        desc "Run an agent"
				params do
					requires :id, type: String, desc: "Agent ID of the agent to run"
				end
				post ':id' do
					@agent = current_user.agents.find(params[:id])
					Agent.async_check(@agent.id)
				end 
				
				desc "Delete a agent"
                                params do
                                        requires :id, type: String, desc: "Agent ID of the agent to delete"
                                end
                                delete ':id' do
                                        current_user.agents.find(params[:id]).destroy!
                                end
			end
		end
	end
end
