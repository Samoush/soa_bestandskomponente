require File.join(Dir.pwd, 'spec', 'factories', 'employees')
require 'spec_helper'

RSpec.describe Employee, type: :model do
  describe 'valid employee' do
  	context 'when validation success' do
      let(:accountant) { FactoryGirl.create(:employee, :role_accountant) }
      let(:purchaser) { FactoryGirl.create(:employee, :role_purchaser) }
      let(:fetched_accountant) { Emplyee.where(role: 'accountant').first }

    	it do
    	  expect(accountant).to be_valid  
    	  expect(purchaser).to be_valid 

        expect(accountant.authentication_key).to eq(fetched_accountant.authentication_key)       
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
