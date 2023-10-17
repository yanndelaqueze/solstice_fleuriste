class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many_attached :photos
  monetize :min_price_cents
  attr_accessor :remove_image
end
