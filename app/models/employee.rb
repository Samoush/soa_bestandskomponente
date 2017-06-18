#FIXME technical debt, requiring of debbuging library should be dne in helpers or env
require 'active_record'
require 'byebug'

#FIXME technical debt, has to be separated per environment db (test and development)
ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "sam",
  password: "Bla123",
  database: "soa_bestandskomponente_test"
)

class Employee < ActiveRecord::Base
  validates :forename, presence: true
  validates :surname, presence: true
  validates :birthday, presence: true
  validates :role, presence: true
  validates :authentication_key, presence: true, uniqueness: true

  validate :defined_role?

  before_validation :set_authentication_key

  ROLES = %w(purchaser accountant)

  private

  def defined_role?
  	#debugger
  	ROLES.include?(role) ? true : errors.add(:role, "not defined")
  end

  def set_authentication_key
  	#debugger
  	self.authentication_key = SecureRandom.uuid
  end
end
