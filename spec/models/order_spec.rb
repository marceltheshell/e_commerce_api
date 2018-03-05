require 'rails_helper'

RSpec.describe Order, :type => :model do
	context 'associations' do
		it 'has many products' do
			should have_many(:products)
		end

		it 'belongs to customer' do
			should belong_to(:customer)
		end
	end

	context 'validations' do
		it 'status should initiate to waiting'
		it 'status should be able to be changed to waiting, on_way or delivered'
		it 'order should have a customer' 
	end
end