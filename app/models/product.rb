class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many_attached :photos
  attr_accessor :remove_image
end
