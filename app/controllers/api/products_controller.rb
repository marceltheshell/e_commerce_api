class Api::ProductsController < ApplicationController
  def index
    # query_dates = params["date"].split(",")
    formatted_start_date = params["start_date"].to_date.beginning_of_day
    formatted_end_date = params["end_date"].to_date.end_of_day
    interval = params["interval"]

    error_msg = "Oops, something went wrong.  Please check to make sure your query params are correctly formatted"
    # if (dates.length != 2) || dates not formatted correctly or 
    #     #return error_msg
    # end



    orders = Order.where(:created_at => formatted_start_date..formatted_end_date)

    binding.pry

    #range will be two date/times which will be passed in and represend the beginning and end ranges of the returned data

    #interval can be day/week/month and will determine what this endpoint will return: breakdown of products sold by quantity per day/week/month
    
    #example:
    # sold by month
    # 1/1/17- 1/30/17 
    # butterflies : 22
    # couches: 10
    # dogs: 2


  end
end