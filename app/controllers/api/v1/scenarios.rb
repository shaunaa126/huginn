module API
	module V1
		class Scenarios < Grape::API
		  include API::V1::Defaults

			resource :scenarios do
				desc "Get current user scenarios"
				get do
					current_user.scenarios.as_json	
				end

			        desc "Discover scenarios"
				get "discover" do
					Scenario.joins(:user).where(:users => {:admin => true}).where(:scenarios => {:public => true})	
				end

				desc "Import a scenario"
				params do
					requires :url, type: String, desc: "URL of the scenario to import"
				end
				post do
					@scenario_import = ScenarioImport.new(:url => params[:url])
					@scenario_import.set_user(current_user)
					@scenario_import.import	
				end
	
				desc "Delete a scenario"
				params do
					requires :id, type: String, desc: "Scenario ID of the scenario to delete"
				end
				delete ':id' do
					current_user.scenarios.find(params[:id]).destroy!
				end
			end
		end
	end
end
