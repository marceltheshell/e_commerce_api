require 'rails_helper'

RSpec.describe Customer, :type => :model do

	context 'associations' do
		it 'has many orders' do
			should have_many(:orders)
		end
	end

	context 'validations' do
		it 'validates email for uniqueness' do
			Customer.create!(email: "unique@u.com")
			expect{ Customer.create!(email: "unique@u.com") }.to raise_error(ActiveRecord::RecordInvalid)
		end
	end
end