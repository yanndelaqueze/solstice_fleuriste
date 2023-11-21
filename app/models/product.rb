class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many_attached :photos, service: :cloudinary, dependent: :destroy
  monetize :min_price_cents
  TYPE = ["Custom", "Normal"]
  attr_accessor :remove_image
  extend FriendlyId
  friendly_id :name, use: :slugged

  # private

  # def delete_photos_from_cloudinary
  #   photos.each do |photo|
  #     Cloudinary::Uploader.destroy(photo.key)
  #   end
  # end
end
