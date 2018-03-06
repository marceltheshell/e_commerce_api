require 'rails_helper'

RSpec.describe Product, :type => :model do
	context 'associations' do
		it { should have_and_belong_to_many(:categories) }
		it { should have_and_belong_to_many(:orders) }
	end

	context 'attributes and validations' do
		it { should validate_presence_of :title }
		it { should validate_presence_of :price }
		it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
	end
end