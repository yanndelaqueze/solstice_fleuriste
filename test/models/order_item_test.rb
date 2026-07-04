require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  setup do
    @order = Order.create!
  end

  test "produit Custom : le sous-total est le prix choisi par le client" do
    item = OrderItem.create!(product: products(:bouquet_personnalise), order: @order, price_cents: 4000)
    assert_equal 4000, item.subtotal_cents
  end

  test "produit Custom : la bulle d'eau ajoute 4 EUR" do
    item = OrderItem.create!(product: products(:bouquet_personnalise), order: @order, price_cents: 4000, water_bubble: true)
    assert_equal 400, item.options_cents
    assert_equal 4400, item.subtotal_cents
  end

  test "produit Custom : le ruban ajoute 10 EUR" do
    item = OrderItem.create!(product: products(:bouquet_personnalise), order: @order, price_cents: 4000, ribbon: true)
    assert_equal 1000, item.options_cents
    assert_equal 5000, item.subtotal_cents
  end

  test "produit Custom : bulle d'eau + ruban se cumulent" do
    item = OrderItem.create!(product: products(:bouquet_personnalise), order: @order, price_cents: 4000, water_bubble: true, ribbon: true)
    assert_equal 1400, item.options_cents
    assert_equal 5400, item.subtotal_cents
  end

  test "produit Normal : le sous-total est quantité x prix catalogue" do
    item = OrderItem.create!(product: products(:orchidee), order: @order, quantity: 3)
    assert_equal 3 * 2500, item.subtotal_cents
  end

  test "produit Normal : les options s'ajoutent au prix catalogue" do
    item = OrderItem.create!(product: products(:orchidee), order: @order, quantity: 1, ribbon: true)
    assert_equal 2500 + 1000, item.subtotal_cents
  end
end
