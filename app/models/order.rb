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
  after_save :set_transport
  before_save :postcode
  after_save :subtotal_cents
  after_save :delivery_cost_cents
  after_save :total_cents
  monetize :subtotal_cents
  monetize :delivery_cost_cents
  monetize :total_cents

  def delivery_transport?
    transport == "Livraison"
  end

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
    if transport == "Click & Collect"
      0
    elsif in_delivery_area?
      if postcode == "97429"
        0
      else
        1000
      end
    end
  end

  def total_cents
    self.subtotal_cents + self.delivery_cost_cents
  end

  def in_delivery_area?
    if self.delivery_address.present?
      lat = Geocoder.search(self.delivery_address).first.data["lat"].to_f
      lon = Geocoder.search(self.delivery_address).first.data["lon"].to_f
      @polygon = Polygon.last
      polygon_coordinates = JSON.parse(@polygon.coordinates)
      n = polygon_coordinates.length
      inside = false

      j = n - 1
      for i in 0...n
        xi, yi = polygon_coordinates[i]
        xj, yj = polygon_coordinates[j]
        intersect = ((yi > lat) != (yj > lat)) &&
                    (lon < ((xj - xi) * (lat - yi) / (yj - yi)) + xi)
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
