
  #create some customers
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
      email: 'q@w.co'
    }
  ])

  #create some categories
  categories = Category.create!([
    {title: "clothes"},
    {title: "food"},
    {title: "furniture"}
  ])

  #create some products
  categories[0].products.create!([{title: "shirt", price: 10}, {title: "pants", price: 10}, {title: "pants", price: 10}])
  categories[1].products.create!([{title: "chicken", price: 10}, {title: "spinach", price: 10 }, {title: "olives", price: 10}])
  categories[2].products.create!([{title: "chair", price: 10}, {title: "couch", price: 10}, {title: "desk", price: 10}])

  #create some orders
  # Customer.first.orders.create!([
  #   {}
  # ])


  


  # Order.create!([
  #   {customer_id: Customer.first.id}
  #   # {customer_id: Customer.second.id},
  #   # {customer_id: Customer.third.id},
  #   # {customer_id: Customer.fourth.id},
  #   # {customer_id: Customer.fifth.id}
  # ])


