
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
  clothes_products = categories[0].products.create!([
    {title: "shirt", price: 10}, 
    {title: "pants", price: 50}, 
    {title: "socks", price: 5}
  ])
  
  food_products = categories[1].products.create!([
    {title: "chicken", price: 10}, 
    {title: "spinach", price: 2 }, 
    {title: "olives", price: 7}
  ])
  
  furniture_products = categories[2].products.create!([
    {title: "chair", price: 100}, 
    {title: "couch", price: 500}, 
    {title: "desk", price: 250}
  ])

  #create some orders
  Customer.first.orders.create!([
    {products: [furniture_products[0], furniture_products[1], clothes_products[0] ]}
  ])

  Customer.second.orders.create!([
    {products: [food_products[0], food_products[0], clothes_products[1] ]}
  ])

  Customer.third.orders.create!([
    {products: [food_products[2], clothes_products[0], clothes_products[1] ]}
  ])
