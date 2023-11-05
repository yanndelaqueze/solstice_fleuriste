class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  TYPE = ["Custom", "Normal"]
  validates :product_type, inclusion: { in: TYPE }
end
