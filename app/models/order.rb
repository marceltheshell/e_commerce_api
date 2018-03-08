class Order < ApplicationRecord
	before_validation :set_total!
	
	has_and_belongs_to_many :products
	belongs_to :customer
	validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :customer_id, presence: true
	enum status: [ :waiting_for_delivery, :on_way, :delivered ]

	def set_total!
  		self.total = products.map(&:price).sum
	end
end
