require File.join(Dir.pwd, 'app', 'models', 'employee')

module Conductors
  module Users
    module Authenticator
      def self.authenticate(parameters)
      	Auth.new(Employee.find(parameters.to_i).present?)
      end

      class Auth
      	attr_accessor :authenticated

      	def initialize(bool)
      		@authenticated = bool
      	end
      end
    end
  end
end
