require 'grape'

require File.join(Dir.pwd, 'app', 'request_handler', 'users', 'authentication')
require File.join(Dir.pwd, 'app', 'representers', 'users', 'authentication')

module Resources
	module Users
		class Authentication < Grape::API
		  resource :users do
		  	route_param :id do
			    get do
			    	debugger
			      authentication = RequestHandler::Users::Authentication.retrieve(params[:id])
			      #welches gem und wie?
			      Representers::Users::Authentication.new(authentication).render
			    end
			  end
		  end
		end
	end
end
