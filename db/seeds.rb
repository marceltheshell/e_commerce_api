# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  customers = Customer.create!([
    {
      first_name: 'Clark',
      last_name: 'Kent',
      email: 'c@k.com'
    }, 
    {
      first_name: 'Diana',
      last_name: 'Prince',
      email: 'd@p.com'
    }, 
    {
      first_name: 'Bruce',
      last_name: 'Wayne',
      email: 'b@w.com'
    }, 
    {
      first_name: 'Logan',
      last_name: 'Wolverine',
      email: 'l@w.com'
    },
    {
      first_name: 'Jeane',
      last_name: 'Grey',
      email: 'j@g.com'
    }
  ])

  #create some categories
  categories = Category.create!([
    {title: "clothes"},
    {title: "food"},
    {title: "furniture"}
  ])

  #create some orders
  binding.pry
  # Customer.first.orders.create!([
  #   {}
  # ])


  # clothes[0].products.create!(name: "shirt")
  # clothes[0].products.create!(name: "pants")
  # clothes[0].products.create!(name: "socks")

  # clothes[1].products.create!(name: "chicken")
  # clothes[1].products.create!(name: "spinach")
  # clothes[1].products.create!(name: "olives")
  
  # clothes[2].products.create!(name: "chair")
  # clothes[2].products.create!(name: "couch")
  # clothes[2].products.create!(name: "desk")


  # Order.create!([
  #   {customer_id: Customer.first.id}
  #   # {customer_id: Customer.second.id},
  #   # {customer_id: Customer.third.id},
  #   # {customer_id: Customer.fourth.id},
  #   # {customer_id: Customer.fifth.id}
  # ])


