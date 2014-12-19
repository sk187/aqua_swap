aqua_swap
=========
Project 1 - PEARS

GA WDI DC September 2014

Overview

Aquaswap is for auqarist to trade/swap their stuff with others.

Technologies Used

Ruby 2.1.2
Ruby on Rails 4.1.1
PostgreSQL Database
User authentication & authorization from Devise gem
Profile picture functionality from Paperclip gem
Testing using rspec-rails, capybara, shoulda-matchers and factory_girl_rails
CSS styling using SASS
User Stories Completed


Users can:
Sign in
Create Account
Delete Posts
Create Posts
Edit Posts
Look at the cart
Look at their stuff
Payment for it
Add Quantity 
Sign Out

ERB

User:
has many products
has one cart

Cart:
belongs to user
has many products

Products:
belongs to many users
belongs to many carts




What's next?

Location/Maps
More styling
Refactoring
Create db for cart
email verification function
payment function
