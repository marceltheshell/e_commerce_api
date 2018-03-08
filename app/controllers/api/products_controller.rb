class Api::ProductsController < ApplicationController
  def index
    start_date = params["start_date"].to_date.beginning_of_day
    end_date = params["end_date"].to_date.end_of_day
    interval = params["interval"]
    products = Order.where(:created_at => start_date..end_date).map {|order| order.products}.flatten
    error_msg = "Oops, something went wrong.  Please check the README to make sure your query params are correctly formatted"

    if interval == "day" || interval == "week" || interval == "month"
      case interval
      when "day"
        render json: ProductsSoldByIntervalSerializer.new(products, start_date, end_date).by_day, status: 200
      when "week"
        render json: ProductsSoldByIntervalSerializer.new(products, start_date, end_date).by_week, status: 200
      when "month"
        render json: ProductsSoldByIntervalSerializer.new(products, start_date, end_date).by_month, status: 200
      end
    else
      render json: error_msg, status: 400
    end
  end
end