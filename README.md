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
Some choices: 
An order should never exist without a customer, but a product can exist without an order.

I replaced the active_record ids with UUIDs to reduce the likleyhood of eventual duplication



* ...
