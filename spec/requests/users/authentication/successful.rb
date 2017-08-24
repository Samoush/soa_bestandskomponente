require 'spec_helper'
require File.join(Dir.pwd, 'spec', 'factories', 'employees')
require File.join(Dir.pwd, 'app', 'resources', 'users', 'authentication')
require File.join(Dir.pwd, 'app','soa_bestandskomponente')

describe Resources::Users::Authentication, type: :request do
	include Rack::Test::Methods

	def app
    #app = lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['All responses are OK']] }
    app = SoaBestandskomponente::API
    builder = Rack::Builder.new
    builder.run app
  end

	let(:user) { FactoryGirl.create(:employee, :role_purchaser) }

	context 'when successful' do
		
		let!(:response) do 
			get "/users/#{user.id}", nil, { 'HTTP_ACCEPT' => 'application/json' }
		end

		let(:json_response_body) { JSON.parse(response.body) }

		it do
			debugger
		end
	end
end

# when testing multiple running apps locally just set up correct ports
#								'http://localhost:6712/users/authentication'
#RestClient.get 'http://example.com/users/authentication', { params: { authentication_key: user.id } }

# WebMock.stub_request(:post, 'api.quickblox.com/')
#   .to_return(status: 201, body: 'whatever', headers: { some_kind_of: 'header' })
