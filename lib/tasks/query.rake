require 'csv'

namespace :query do
  desc "returns customer_id, customer_name, category_id and category_name"
  task customer_category: :environment do
    c = Customer.all
    
  end

  desc "returns a CSV of all products sold during an date range by an interval"
  task products_sold_csv: :environment do
    ARGV.each { |a| task a.to_sym do ; end }
    result = nil
    start_date = ARGV[1].to_date.beginning_of_day
    end_date = ARGV[2].to_date.end_of_day
    interval = ARGV[3]
    products = Order.where(:created_at => start_date..end_date).map {|order| order.products}.flatten

    if interval == "day" || interval == "week" || interval == "month"
      case interval
      when "day"
          result =  ProductsSoldByIntervalSerializer.new(products, start_date, end_date).by_day
      when "week"
          result =  ProductsSoldByIntervalSerializer.new(products, start_date, end_date).by_week
      when "month"
          result =  ProductsSoldByIntervalSerializer.new(products, start_date, end_date).by_month
      end
    end

    csv_str = CSV.open("results.csv","w") do |csv|
      result.each do |hash|
        csv << hash
      end
    end
    puts csv_str
  end
end
