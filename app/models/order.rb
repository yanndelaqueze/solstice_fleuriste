class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true
  geocoded_by :delivery_address
  after_validation :geocode, if: :will_save_change_to_delivery_address?
  STATUS = ["En cours", "En Attente de Paiement", "Payée", "En préparation", "Prête", "Livrée", "Annulée", "Remboursée"]
  validates :status, inclusion: { in: STATUS }
  TRANSPORT = ["Click & Collect", "Livraison"]
  validates :transport, inclusion: { in: TRANSPORT }
  SLOT = ["Matin", "Midi", "Soir"]
  validates :time_slot, inclusion: { in: SLOT }
  validates :delivery_address, presence: true, if: :delivery_transport?
  before_save :set_default_date
  before_save :set_transport
  before_save :postcode
  before_save :subtotal_cents
  before_save :delivery_cost_cents
  before_save :total_cents
  monetize :subtotal_cents
  monetize :delivery_cost_cents
  monetize :total_cents

  def postcode
    if self.delivery_address.present?
      return Geocoder.search(delivery_address).first.data["address"]["postcode"]
    else
      return ""
    end
  end

  def subtotal_cents
    order_items ? self.order_items.sum { |item| item.subtotal_cents } : 0
  end

  def delivery_cost_cents
    if postcode == "97429"
      0
    else
      1000
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
