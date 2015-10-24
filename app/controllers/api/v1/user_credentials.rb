module API
	module V1
		class UserCredentials < Grape::API
		  include API::V1::Defaults

			resource :user_credentials do
				desc "Get current user credentials"
				get do
					current_user.user_credentials.as_json	
				end
	
			        desc "Delete user credential"
                                params do
                                        requires :id, type: String, desc: "User Credential ID of credential to delete"
                                end
                                delete ':id' do
                                        current_user.user_credentials.find(params[:id]).destroy!
                                end
			end
		end
	end
end
