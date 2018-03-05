require 'rails_helper'

RSpec.describe Category, :type => :model do
	context 'associations' do
		it 'has and belongs to many products' do
			should have_and_belong_to_many(:products)
		end
	end

	context 'validations' do
		it 'validates title' do
			expect(Category.create!(title: "an_example")).to be_valid
			expect{ Category.create!() }.to raise_error(ActiveRecord::RecordInvalid)
		end
	end
end