class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true
  geocoded_by :delivery_address
  after_validation :geocode, if: :will_save_change_to_delivery_address?
  STATUS = ["En cours", "Validée", "Payée", "En préparation", "Prête", "Livrée"]
  validates :status, inclusion: { in: STATUS }
  TRANSPORT = ["Click & Collect", "Livraison"]
  validates :transport, inclusion: { in: TRANSPORT }
  validates :delivery_address, presence: true, if: :delivery_transport?
  monetize :subtotal_cents
  monetize :delivery_cost_cents
  monetize :total_cents
  before_create :set_default_date
  before_create :subtotal_cents
  before_create :delivery_cost_cents
  before_create :total_cents
  before_save :set_transport

  def subtotal_cents
    order_items ? self.order_items.sum { |item| item.price_cents } : 0
  end

  def delivery_cost_cents
    0
  end

  def total_cents
    self.subtotal_cents + self.delivery_cost_cents
  end

  def delivery_transport?
    transport == "Livraison"
  end

  def in_delivery_area?
    if self.delivery_address
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
