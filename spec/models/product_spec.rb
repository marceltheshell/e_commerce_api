require 'rails_helper'

RSpec.describe Product, :type => :model do
	context 'associations' do
		it 'has and belongs to many categories' do
			should have_and_belong_to_many(:categories)
		end

		it 'belongs to order' do
			should belong_to(:order)
		end
	end

	context 'validations' do
		it 'validates name' do
			expect(Product.create!(name: "an_example")).to be_valid
			expect{ Product.create!() }.to raise_error(ActiveRecord::RecordInvalid)
		end
	end
end