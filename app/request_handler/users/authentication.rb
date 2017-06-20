require File.join(Dir.pwd, 'app', 'conductors', 'users', 'authenticator')

module RequestHandler
  module Users
    module Authentication
      def self.retrieve(parameters)
        Authenticator.authenticate(parameters)
      end
    end
  end
end
