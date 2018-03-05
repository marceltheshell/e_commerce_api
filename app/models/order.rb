class Order < ApplicationRecord
	has_many :products
	belongs_to :customer
	enum status: [ :waiting_for_delivery, :on_way, :delivered ]
end
