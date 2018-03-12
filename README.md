# Shipt Requirements 
1. A product belongs to many categories. A category has many products. A product can be sold in decimal amounts (such as weights).
_done_

2. A customer can have many orders. An order is comprised of many products. An order has a status stating if the order is waiting for delivery, on its way, or delivered.
_done_

3. Write a SQL query to return the results as display below:
_done_
Note: it is included in a file called sql_query.md in the root of the project.

Example

customer_id customer_first_name category_id category_name number_purchased

1 John 1 Bouquets 15

4. Include the previous result as part of a function in the application. If you are using an ORM, please write the query in your ORM's DSL. Leave the original SQL in a separate file.
_done_
Note: I put it in a rake task called `customer_category` in namespace `query`.  To run it, from the CLI run the command `rake query:customer_categories_purchased`

5. An API endpoint that accepts a date range and a day, week, or month and returns a breakdown of products sold by quantity per day/week/month.
_done_
Note: The api endpoint is GET '/product' and it accepts three query params: `start_date`, `end_date` and `interval`. `start_date` and `end_date` should be dates formatted as YYYY-MM-DD.  Only this format is currently supported (which is very brittle and a place for improvement in this api). These dates will determine the range in which the data will be returned.  `Interval` should be the string "day", "week" or "month". It will determine whether the quantitiy of products sold will be returned as by day, week, or month.  This endpoint returns JSON.  

_Example URL_
http://localhost:3000/api/product?start_date=2018-03-08&end_date=2018-03-08&interval=day

6. Ability to export the results of #5 to CSV.
_done_
Note: I decided to turn this into a rake task since it was not specifically mentioned that the results should be returned through an HTTP request.  It exists in namespace `query` as `products_sold_csv`. The rake task uses the same serializer as the GET '/product' and accepts the same arguments. To run, in the CLI enter command
`rake query:products_sold_csv <start_date> <end_date> <interval>`where
`<start_date>` is date formatted by Y-M-D, ex: 2011-02-22
`<end_date>` is date formatted by Y-M-D, ex: 2011-02-22
`<interval>` the string "day", "week" or "month", ex: "week"

** each argument be separated by a space and should not be enclosed in parentheses, ex: rake query:products_sold_csv 2011-02-22 2011-03-22 "week" 

7. An API endpoint that returns the orders for a customer.
_done_ 
Note: 
The api endpoint is GET '/customer/:id/orders' The URL param ":id" should be the customer_id (type:UUID) and will return all of the orders which belong to that customer.

_Example URL_
http://localhost:3000/api/customer/408353ad-2728-4c6f-99c3-06dd996d45b9/orders


Additional questions

No coding necessary, explain the concept or sketch your thoughts.

8. _Question:_ We want to give customers the ability to create lists of products for a one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?

_Answer:_ (A supporting diagram is located in the project root titled: shipt_ERD.pdf)   I would create a new table called Item_list which would essentially have the same associations as Order: it would belong to Customer and have a has_and_belongs_to_many relationship with products.   When a customer wants to purchase their Item_list, a method would be invoked which would take each of the products associated with a given Item_list and create a new Order record with those same items.  The benefits of this approach are separation of entities.  Item_list and Orders are separate entities, even though an item_list can inform an Order

9. _Question:_ If Shipt knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, how do you distribute the inventory among customers checking out?

_Answer:_ Since we know exactly what the inventory is of an item, I would set a flag to be raised when total supply of an item reaches a certain lower limit.  If a customer adds that item to their current shopping cart, a message should be displayed which notifies the customer that supply for that item is low (possibly displaying how many of the item are left) and will be reserved for them during a period of time (possibly five minutes?).  A decrementing timer should be displayed, costing down the time the customer has until the hold on that item has expired.  This operation should preferably not take place on the server, but rather in the database.  This is because it is advised not to keep any sort of state in on the server, in case of faults.  

# Hosting
* The api is currently hosted on Heroku at the url https://shipt-api-1.herokuapp.com/
* Active endpoints: 
1. https://shipt-api-1.herokuapp.com/api/product?start_date=<date>&end_date=<date>&interval=<interval>
2. https://shipt-api-1.herokuapp.com/api/customer/:id/orders

# To RUN Locally
## System dependencies
You will need to have ruby 2.4.1, Postgres Rails 5.1 installed on your machine.  Once that is done, download the file and run the command `bundle install` to install all necessary gems

## Database creation
First ensure Postgres is running.  Then run the commands: rake db:create db:migrate db:seed to create, initialize and seed the DB

## How to run the test suite
You can run the test suite with the rspec command.  Unfortunately only the models have test coverage... with more time I would write tests for the serializer, controllers and two rake tasks.

## Server
Run the command `rails s` and the root app will default to `http://localhost:3000/`

## Rake Tasks
In namespace `query` I have two rake tasks
1. customer_categories_purchased
2. products_sold_csv

## API endpoints
There are two endpoints: 
1. GET '/product'
2. GET '/customer/:id/orders'

## A few conscious choices and things to improve: 
* I replaced the active_record ids with UUIDs to reduce the likleyhood of eventual duplication.

* Test coverage is weak, with only the models being fully covered.  Next steps would be to strengthen that by writing more tests. 

* In ProductsSoldByIntervalSerializer, the by_week and by_month methods are using nested loop structures which are costly in terms of Auxiliary Time used, O(N^2).  Ideally I would like to refactor those methods to something with a maximum auxiliary time of O(N).
