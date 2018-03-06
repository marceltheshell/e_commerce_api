require 'rails_helper'

RSpec.describe Customer, :type => :model do

  context 'associations' do
    it { should have_many(:orders) }
  end

  context 'validations' do
    
    before do
      @customer = Customer.create!(email: "g@g.co")
      3.times { Order.create!(customer: @customer) }
    end

    it "destroys the associated products on self destruct" do
        orders = @customer.orders
        @customer.destroy
        orders.each do |order|
          expect(Order.find(order)).to raise_error ActiveRecord::RecordNotFound
        end
    end

    it 'validates email for uniqueness' do
      Customer.create!(email: "unique@u.com")
      expect{ Customer.create!(email: "unique@u.com") }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end