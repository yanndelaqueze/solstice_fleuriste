class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many_attached :photos, service: :cloudinary, dependent: :destroy
  before_destroy :delete_photos_from_cloudinary
  monetize :min_price_cents
  TYPE = ["Custom", "Normal"]
  # validates :product_type, inclusion: { in: TYPE }
  attr_accessor :remove_image

  private

  def delete_photos_from_cloudinary
    photos.each do |photo|
      # Extract the Cloudinary public_id from the Active Storage URL
      public_id = photo.key
      # Use Cloudinary's API to delete the photo by its public_id
      Cloudinary::Uploader.destroy(public_id)
    end
  end
end
