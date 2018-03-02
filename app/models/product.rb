class Product < ApplicationRecord
	belongs_to :order
	has_many :categories
end
