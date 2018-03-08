class Api::ProductsController < ApplicationController
  def index
    date = params["date"]
    interval = params["interval"]

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