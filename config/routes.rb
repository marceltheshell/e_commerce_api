Rails.application.routes.draw do
  namespace :api do 
    get     '/product',                   to: 'products#index'
    get     '/customer/:id/orders',       to: 'customers#orders'
  end
end
