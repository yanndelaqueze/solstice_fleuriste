class OrderItem < ApplicationRecord
  OCCASIONS = ["Spontané", "Bonne fête !", "Remerciement", "Mariage", "Anniversaire", "Anniversaire de mariage", "Deuil", "Saint Valentin", "Commémoration", "Bon rétablissement", "Fête des mères", "Pour se faire plaisir", "Fête des grands-mères"]
  belongs_to :product
  belongs_to :order
  belongs_to :user, optional: true
  # validates :occasion, inclusion: { in: OCCASIONS }
  # validates :color, inclusion: { in: COLORS }
  # validates :price, presence: true, numericality: { greater_than: 0, message: 'Ne peut pas être vide' }
  monetize :price_cents
  monetize :subtotal_cents
  monetize :options_cents
  before_create :options_cents
  before_create :subtotal_cents

  def options_cents
    bubble_cents = water_bubble ? 400 : 0
    ribbon_cents = ribbon ? 1000 : 0
    return bubble_cents + ribbon_cents
  end

  def subtotal_cents
    if self.product.product_type == "Custom"
      return price_cents + options_cents
    elsif self.product.product_type == "Normal"
      return (self.quantity * self.product.min_price_cents) + options_cents
    end
  end
end
