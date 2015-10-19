module API
  module V1
    class Sessions < Grape::API
      include API::V1::Defaults

      resource :sessions do
        desc "Authenticate User and return user object / access token"
        params do
          requires :email, type: String, desc: "Email"
          requires :password, type: String, desc: "Password"
        end

       post do
         email = params[:email]
         password = params[:password]

         if email.nil? or password.nil?
           error!({error_code: 404, error_message: "Invalid Email or Password."},401)
           return
         end

         user = User.where(email: email.downcase).first
         if user.nil?
           error!({error_code: 404, error_message: "Invalid Email or Password."},401)
           return
         end

         if !user.valid_password?(password)
           error!({error_code: 404, error_message: "Invalid Email or Password."},401)
           return
         else
           user.ensure_authentication_token
           user.save
           {status: 'ok', token: user.authentication_token}.to_json
         end
       end

	desc "Destroy the access token"
   	params do
    	 	requires :api_key, type: String, desc: "User Access Token"
   	end
   	delete ':api_key' do
     		access_token = params[:api_key]
     		user = User.where(authentication_token: access_token).first
     		if user.nil?
       			error!({error_code: 404, error_message: "Invalid access token."},401)
       			return
     		else
       			user.reset_authentication_token
       			#{status: 'ok'}
     		end
   	end
    end
end
  end
end
