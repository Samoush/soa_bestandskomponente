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
  	ROLES.include?(role) ? true : errors.add(:role, "not defined")
  end

  def set_authentication_key
  	self.authentication_key = SecureRandom.uuid
  end
end
