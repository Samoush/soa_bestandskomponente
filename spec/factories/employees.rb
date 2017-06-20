require 'factory_girl'
require 'faker'

require File.join(Dir.pwd, 'app', 'models', 'employee')

FactoryGirl.define do
  factory :employee do
    forename { Faker::Name.name }
    surname { Faker::Name.name }
    birthday { Date.today }

    trait :role_accountant do
    	role { 'accountant' }
    end

    trait :role_purchaser do
    	role { 'purchaser' }
    end
  end
end
