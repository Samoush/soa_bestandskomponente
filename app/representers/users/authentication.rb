require 'supa'

module Representers
  module Users
    class Authentication 
    	include Supa::Representable
    	
    	define do
		    namespace :jsonapi do
		      virtual :version, getter: 1.1
		    end

		    namespace :data do
    			attribute :authenticated
    		end
    	end
    end
  end
end
