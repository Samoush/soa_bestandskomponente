require File.join(Dir.pwd, 'app', 'models', 'employee')
require File.join(Dir.pwd, 'spec', 'factories', 'employees')
require 'factory_girl'

RSpec.describe Employee, type: :model do
  describe 'valid employee' do
  	context 'when validation success' do
    	it do
    	  expect(FactoryGirl.create(:employee, :role_accountant)).to be_valid  
    	  expect(FactoryGirl.create(:employee, :role_purchaser)).to be_valid        
    	end
    end

    context 'when validation fails' do
    	it do
    		expect{ FactoryGirl.create(:employee, role: 'blabla') }.to raise_error(ActiveRecord::RecordInvalid)   
    		expect{ FactoryGirl.create(:employee) }.to raise_error(ActiveRecord::RecordInvalid) 
    	end
    end
  end  
end
