require 'grape'

require File.join(Dir.pwd, 'app','resources', 'users', 'authentication')

module SoaBestandskomponente
	class API < Grape::API
		content_type :jsonapi, 'application/json'

		mount Resources::Users::Authentication
	end
end
