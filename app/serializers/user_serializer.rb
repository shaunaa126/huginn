class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :username, :authentication_token
end
