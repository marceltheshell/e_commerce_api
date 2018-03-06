class Product < ApplicationRecord
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :orders
	belongs_to :order, optional: true
	validates :name, presence: true
end
