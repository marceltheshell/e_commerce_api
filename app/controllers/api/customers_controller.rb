class Api::CustomersController < ApplicationController
  def orders
    customer_orders = Customer.find(params[:id]).orders
    render json: customer_orders.as_json, status: :ok
  end
end