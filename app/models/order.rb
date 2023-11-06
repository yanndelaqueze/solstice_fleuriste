class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true
  geocoded_by :delivery_address
  after_validation :geocode, if: :will_save_change_to_delivery_address?
  STATUS = ["En cours", "En Attente de Paiement", "Payée", "En préparation", "Prête", "Livrée", "Annulée", "Remboursée"]
  validates :status, inclusion: { in: STATUS }
  TRANSPORT = ["Click & Collect", "Livraison"]
  validates :transport, inclusion: { in: TRANSPORT }
  validates :delivery_address, presence: true, if: :delivery_transport?
  monetize :subtotal_cents
  monetize :delivery_cost_cents
  monetize :total_cents
  before_save :set_default_date
  before_save :postcode
  before_save :subtotal_cents
  before_save :delivery_cost_cents
  before_save :total_cents
  before_save :set_transport

  def subtotal_cents
    order_items ? self.order_items.sum { |item| item.subtotal_cents } : 0
  end

  def delivery_cost_cents
    if self.transport == "Click & Collect"
      return 0
    elsif self.delivery_address.present? && self.transport == "Livraison" && self.postcode == "97429"
      return 20000
    else
      return 1000
    end
  end

  def total_cents
    self.subtotal_cents + self.delivery_cost_cents
  end

  def delivery_transport?
    transport == "Livraison"
  end

  def in_delivery_area?
    if self.delivery_address.present?
      if self.postcode == "97429"
        return true
      end
      @polygon = Polygon.last
      polygon_coordinates = JSON.parse(@polygon.coordinates)
      n = polygon_coordinates.length
      inside = false

      j = n - 1
      for i in 0...n
        xi, yi = polygon_coordinates[i]
        xj, yj = polygon_coordinates[j]
        intersect = ((yi > latitude) != (yj > latitude)) &&
                    (longitude < ((xj - xi) * (latitude - yi) / (yj - yi)) + xi)
        if intersect
          inside = !inside
        end
        j = i
      end
      return inside
    else
      return false
    end
  end

  def postcode
    if self.delivery_address.present? & self.transport == "Livraison"
      Geocoder.search([latitude, longitude]).first.data["address"]["postcode"]
    else
      return nil
    end
  end

  private

  def set_default_date
    self.date ||= 2.days.from_now.to_date
  end

  def set_transport
    if !self.in_delivery_area?
      self.transport = "Click & Collect"
    end
  end
end
