# README


* System dependencies
You will need to have ruby 2.4.1, Postgres Rails 5.1 installed on your machine.  Once that is done, download the file and run the command `bundle install` to install all necessary gems

* Database creation
First make sure Postgres is running.  Then run the commands: rake db:create db:migrate db:seed to create, initialize and seed the DB

* How to run the test suite
You can run the test suite with the rspec command.  Unfortunately only the models have test coverage... with more time I would write tests for the serializer, controllers and two rake tasks.

* Server
Run the command `rails s` and the root app will default to `http://localhost:3000/`

* Rake Tasks
In namespace `query` I have two rake tasks
1. customer_category which returns ...
To run, in the CLI use command rake query:customer_category
2. products_sold_csv which returns a CSV of all products sold within a range of start=>end dates and by a certain interval
To run, in the CLI use command rake query:products_sold_csv <start_date> <end_date> <interval> where
<start_date> is a date formatted by Y-M-D, ex: 2011-02-22
<start_date> is a date formatted by Y-M-D, ex: 2011-02-22
<interval> the string "day", "week" or "month", ex: "week"
Note: each argument be separated by a space and should not be enclosed in parentheses, ex: rake query:products_sold_csv 2011-02-22 2011-03-22 "week"

* API endpoints
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

* A few conscious choices: 
I replaced the active_record ids with UUIDs to reduce the likleyhood of eventual duplication

In ProductsSoldByIntervalSerializer, the by_week and by_month methods are using nested loop structures which are costly in terms of Auxiliary Time used, O(N^2).  Ideally I would like to refactor those methods to something with a maximum auxiliary time of O(N).

