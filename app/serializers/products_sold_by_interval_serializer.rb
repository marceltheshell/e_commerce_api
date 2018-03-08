class ProductsSoldByIntervalSerializer

	def initialize(products, start_date, end_date)
		@products = products
		@start_date = start_date
		@end_date = end_date
	end

	def by_day
		start = @start_date
		stop = @end_date
		frequency_of_sales = {}
		
		#create a hash with all of the days between the range as keys
		while (start <= stop) do
			frequency_of_sales[start] = {}
			start += 1.day
		end

		#increment the values of those keys every time an item was sold on that day
		@products.each do |product|
			if frequency_of_sales[product.created_at.beginning_of_day][product.title] != nil
				frequency_of_sales[product.created_at.beginning_of_day][product.title] += 1
			else
				frequency_of_sales[product.created_at.beginning_of_day][product.title] = 1
			end
		end

		json = {}
		json["interval"] = "by_day"
		json["start_date"] = @start_date
		json["end_date"] = @end_date
		json["frequency_of_sales"] = frequency_of_sales
		return json
	end

	def by_week
		start = @start_date
		stop = @end_date
		frequency_of_sales = {}
		
		#create a hash with all of the days between the range as keys
		while (start <= stop) do
			frequency_of_sales[start] = {}
			start += 1.week
		end

		@products.each do |product|
			if frequency_of_sales[product.created_at.beginning_of_day][product.title] != nil
				frequency_of_sales[product.created_at.beginning_of_day][product.title] += 1
			else
				frequency_of_sales[product.created_at.beginning_of_day][product.title] = 1
			end
		end

		json = {}
		json["interval"] = "by_week"
		json["start_date"] = @start_date
		json["end_date"] = @end_date
		json["frequency_of_sales"] = frequency_of_sales
		return json
	end

	def by_month
	end

end

