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

		it 'should default status to waiting_for_delivery' do 
			customer = Customer.create!(email: "thing@thing.co")
			order = Order.create!(total: 0, customer: customer)
			expect(order.status).to eq("waiting_for_delivery")
		end
	end

	context 'set_total!' do
		before(:each) do
			customer = Customer.create!(email: "i@i.co")
			product_1 = Product.create!(title: "water", price: 100) 
			product_2 = Product.create!(title: "wine", price: 50) 

			@order = Order.create!(customer: customer, product_ids: [product_1.id, product_2.id])
		end

		it "returns the total amount to pay for the products" do
			expect(@order.set_total!).to eq(0.15e3)
		end
	end
end