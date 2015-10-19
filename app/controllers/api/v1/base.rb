require "grape-swagger"

module API
	module V1
		class Base < Grape::API
		  mount API::V1::Sessions
			mount API::V1::Users
	
			add_swagger_documentation(
                                mount_path: "/api/v1/swagger_doc",
                                api_version: "v1",
                                hide_documentation_path: true,
                                hide_format: true )
		end
	end
end
