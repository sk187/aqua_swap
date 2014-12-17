class Product < ActiveRecord::Base
  belongs_to :user

  validates :product_name, :presence => true
  validates :description, :presence => true
  validates :image, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :quantity, :presence => true
end