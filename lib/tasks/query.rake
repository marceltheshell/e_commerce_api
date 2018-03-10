require 'csv'

namespace :query do
  desc "returns customer_id, customer_name, category_id and category_name"
  task customer_category: :environment do
    
    sql = "SELECT  c.first_name, c.id, cp.category_id, ca.id, ca.title, count(ca.id) as CategoriesSold 
          FROM Customers as c
          INNER JOIN Orders as o
          ON o.customer_id = c.id
          INNER JOIN Orders_products op
          ON o.id = op.order_id
          INNER JOIN Categories_products cp
          ON op.product_id = cp.product_id
          INNER JOIN Categories ca
          ON cp.category_id = ca.id
          GROUP BY c.first_name, c.id, cp.category_id, ca.id, ca.title"

     def execute_statement(sql)
        results = ActiveRecord::Base.connection.exec_query(sql)
        if results.present?
            puts results
        else
            puts "Something is not right"
        end
    end
    execute_statement(sql)

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
