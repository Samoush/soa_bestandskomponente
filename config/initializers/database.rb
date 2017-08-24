require 'active_record'

module Ludwig
	if ENV['RACK_ENV'] == 'development'
		ActiveRecord::Base.establish_connection(
		  adapter:  "mysql2",
		  host:     "localhost",
		  username: "sam",
		  password: "Bla123",
		  database: "soa_bestandskomponente_development"
		)
	else
		ActiveRecord::Base.establish_connection(
		  adapter:  "mysql2",
		  host:     "localhost",
		  username: "sam",
		  password: "Bla123",
		  database: "soa_bestandskomponente_test"
		)
	end
end
