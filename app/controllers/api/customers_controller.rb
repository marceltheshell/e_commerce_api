class Api::CustomersController < ApplicationController
  def show
    customer_orders = Customer.find(params[:id]).orders
    render json: customer_orders.as_json, status: :ok
  end
end