require "grape-swagger"

module API
	module V1
		class Base < Grape::API
		  	mount API::V1::Sessions
			mount API::V1::Users
			mount API::V1::Agents
			mount API::V1::Scenarios
			mount API::V1::Events
			mount API::V1::UserCredentials
	
			add_swagger_documentation(
                                mount_path: "/api/v1/swagger_doc",
                                api_version: "v1",
                                hide_documentation_path: true,
                                hide_format: true )
		end
	end
end
