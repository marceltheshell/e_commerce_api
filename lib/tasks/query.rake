namespace :query do
  desc "returns customer_id, customer_name, category_id and category_name"
  task customer_category: :environment do
  	c = Customer.all.first_name
  	puts c
  end

end
