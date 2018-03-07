require 'rails_helper'

RSpec.describe Order, :type => :model do
	context 'associations' do
		it { should have_and_belong_to_many(:products) }
		it { should belong_to(:customer) }
	end

	context 'validations' do
		it { should respond_to(:total) }
  		it { should respond_to(:customer_id) }

  		it { should validate_presence_of :customer_id }
  		it { should validate_presence_of :total}
  		it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }
		
		it 'should default status to waiting_for_delivery' do 
			customer = Customer.create!(email: "thing@thing.co")
			order = Order.create!(total: 0, customer: customer)
			expect(order.status).to eq("waiting_for_delivery")
		end
	end
end