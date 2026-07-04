require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "une commande vide est valide avec les valeurs par défaut" do
    order = Order.new
    assert order.valid?
    assert_equal "En cours", order.status
    assert_equal "Click & Collect", order.transport
    assert_equal "Midi", order.time_slot
  end

  test "un statut inconnu est refusé" do
    order = Order.new(status: "Expédiée")
    assert_not order.valid?
  end

  test "un mode de transport inconnu est refusé" do
    order = Order.new(transport: "Drone")
    assert_not order.valid?
  end

  test "un créneau horaire inconnu est refusé" do
    order = Order.new(time_slot: "Nuit")
    assert_not order.valid?
  end

  test "la livraison exige une adresse" do
    order = Order.new(transport: "Livraison")
    assert_not order.valid?
    assert order.errors[:delivery_address].present?

    order.delivery_address = "12 rue des Fleurs, Petite-Île"
    assert order.valid?
  end

  test "le Click & Collect n'exige pas d'adresse" do
    order = Order.new(transport: "Click & Collect")
    assert order.valid?
  end

  test "la date par défaut est dans 2 jours" do
    order = Order.create!
    assert_equal 2.days.from_now.to_date, order.date.to_date
  end

  test "le sous-total est la somme des articles" do
    order = Order.create!
    OrderItem.create!(product: products(:bouquet_personnalise), order: order, price_cents: 4000)
    OrderItem.create!(product: products(:orchidee), order: order, quantity: 2)
    assert_equal 4000 + 2 * 2500, order.reload.subtotal_cents
  end

  test "la livraison est gratuite en Click & Collect" do
    order = Order.create!(transport: "Click & Collect")
    assert_equal 0, order.delivery_cost_cents
  end

  test "la livraison est gratuite à Petite-Île" do
    order = Order.new(transport: "Livraison", delivery_address: "12 rue des Fleurs",
                      in_delivery_area: true, town: "Petite-Île")
    assert_equal 0, order.delivery_cost_cents
  end

  test "la livraison coûte 10 EUR hors de Petite-Île (dans la zone)" do
    order = Order.new(transport: "Livraison", delivery_address: "12 rue des Palmiers",
                      in_delivery_area: true, town: "Saint-Joseph")
    assert_equal 1000, order.delivery_cost_cents
  end

  test "le total additionne articles et frais de livraison" do
    order = Order.create!(transport: "Livraison", delivery_address: "12 rue des Palmiers",
                          in_delivery_area: true, town: "Saint-Joseph")
    OrderItem.create!(product: products(:bouquet_personnalise), order: order, price_cents: 4000)
    assert_equal 4000 + 1000, order.reload.total_cents
  end
end
