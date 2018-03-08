# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.4.1

* System dependencies

* Configuration

* Database creation
rake db:create db:migrate
rails db:seed

* Database initialization

* How to run the test suite
You can run the test suite with the rspec command.  

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* API 
** There are two endpoints: 
GET '/product'
GET '/customer/:id/orders'

** GET '/product' accepts two query params: date and interval
*** date should be two dates formatted Y-M-D separated by a semicolon, ex: 2011-02-22;2011-03-22.  The earlier date should come first while the later date should come second. 
This will determine the range of dates in which the data will be returned.  
*** interval should be the string "day", "week" or "month" 
It will determine whether the quantitiy of products sold will be returned as by day, week, or month

*** Examples
http://localhost:3000/api/product?start_date=2018-03-08&end_date=2018-03-08&interval=day


** GET '/customer/:id/orders'
No query params will be accepted.  The URL param ":id" should be the customer_id (type:UUID) and will return all of the orders which belong to that customer.

Some choices: 
An order should never exist without a customer, but a product can exist without an order.

I replaced the active_record ids with UUIDs to reduce the likleyhood of eventual duplication

In ProductsSoldByIntervalSerializer, the by_week and by_month methods are using nested loop structures which are costly in terms of Auxiliary Time used, O(N^2).  Ideally I would like to refactor those methods to something with a maximum of O(N).



* ...
