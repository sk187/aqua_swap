class CreateProducts < ActiveRecord::Migration
  def change
  	create_table :products do |t|
  		t.text :product_name 
  		t.text :description
  		t.text :image
  		t.integer :price
  		t.text :seller
  		t.integer :quantity
  		t.integer :user_id
  		t.timestamps
  	end
  end
end
