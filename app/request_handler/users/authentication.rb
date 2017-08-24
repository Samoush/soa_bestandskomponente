require File.join(Dir.pwd, 'app', 'conductors', 'users', 'authenticator')

module RequestHandler
  module Users
    module Authentication
      def self.retrieve(parameters)
        Conductors::Users::Authenticator.authenticate(parameters)
      end
    end
  end
end
