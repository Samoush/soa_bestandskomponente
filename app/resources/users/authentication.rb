require 'grape'
require 'supa'

require File.join(Dir.pwd, 'app', 'request_handler', 'users', 'authentication')
require File.join(Dir.pwd, 'app', 'representers', 'users', 'authentication')

module Resources
	module Users
		class Authentication < Grape::API
		  resource :users do
		  	route_param :id do
			    get do
			      authentication = RequestHandler::Users::Authentication.retrieve(params[:id])
			      Representers::Users::Authentication.new(authentication).as_json
			    end
			  end
		  end
		end
	end
end
