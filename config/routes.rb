Rails.application.routes.draw do
  namespace :api do 
    get     '/products',       to: 'products#index'
  end
end
