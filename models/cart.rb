class Cart < ActiveRecord::Base
	has_many :products
	belongs_to :user

	validates :quantity, :presence => true
end