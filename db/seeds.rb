require_relative "../models/user"
require_relative "../models/product"

User.create([
  { :user_name => "aquaswapper", :email => "aqua@swap.com", :password => "aqua", :password_confirmation => "aqua"}
])

Product.create([
  { :product_name => "Crystal Red Shrimp", :description => "Grade SS", :image => "http://www.planetinverts.com/crsgradeguide/ss/ssnoentry.jpg", :price => "4.00", :seller => "aquaswapper", :quantity =>"20", :user_id =>"1"},
  { :product_name => "Seiryu Stone", :description => "ADA Seiryu Stones for your hardscape", :image => "http://i.ebayimg.com/00/s/Njc0WDg5OQ==/$(KGrHqR,!jIFBe7dhiIMBQYBFPSCUw~~60_35.JPG", :price => "2.70", :seller => "aquaswapper", :quantity =>"5", :user_id =>"1" },
  { :product_name => "Rimless Tank", :description => "Rimless Green Leaf Tank", :image => "http://glassbox-design.com/wp-content/uploads/2009/11/Green-Leaf-Aquarium-Rimless-Tank.png", :price => "96", :seller => "aquaswapper", :quantity =>"2", :user_id =>"1" },
])