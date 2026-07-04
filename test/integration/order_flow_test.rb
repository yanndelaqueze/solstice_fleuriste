require "test_helper"
require "ostruct"
require "minitest/mock"

class OrderFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # Une date de livraison toujours autorisée (ni lundi, ni dimanche soir)
  def valid_delivery_date
    Date.current.next_occurring(:wednesday)
  end

  def fill_contact_info(order, extra = {})
    patch order_path(order),
          params: { order: { first_name: "Claire", last_name: "Dupont",
                             email: "claire@example.com", phone: "0692123456",
                             date: valid_delivery_date }.merge(extra) },
          headers: { "HTTP_REFERER" => panier_path }
  end

  test "un invité ajoute un bouquet personnalisé à son panier" do
    assert_difference "OrderItem.count", 1 do
      post product_order_items_path(products(:bouquet_personnalise)),
           params: { order_item: { price: 40, occasion: "Anniversaire", message: "Joyeux anniversaire !" } }
    end
    assert_redirected_to panier_path

    item = OrderItem.last
    assert_equal 4000, item.price_cents
    assert_equal "En cours", item.order.status

    follow_redirect!
    assert_response :success
  end

  test "un invité ajoute un produit standard avec une quantité" do
    post product_order_items_path(products(:orchidee)),
         params: { order_item: { quantity: 2 } }
    assert_redirected_to panier_path
    assert_equal 2 * 2500, OrderItem.last.subtotal_cents
  end

  test "la validation refuse une commande sans coordonnées" do
    post product_order_items_path(products(:bouquet_personnalise)),
         params: { order_item: { price: 40 } }
    order = OrderItem.last.order

    patch validate_order_path(order)

    assert_redirected_to panier_path
    assert flash[:danger].present?
  end

  test "la validation refuse une livraison le lundi" do
    post product_order_items_path(products(:bouquet_personnalise)),
         params: { order_item: { price: 40 } }
    order = OrderItem.last.order
    fill_contact_info(order, date: Date.current.next_occurring(:monday))

    patch validate_order_path(order)

    assert_redirected_to panier_path
    assert_match "dimanche", flash[:danger]
  end

  test "une commande complète part vers le paiement Stripe" do
    post product_order_items_path(products(:bouquet_personnalise)),
         params: { order_item: { price: 40 } }
    order = OrderItem.last.order
    fill_contact_info(order)

    fake_session = OpenStruct.new(id: "cs_test_123")
    Stripe::Checkout::Session.stub(:create, fake_session) do
      patch validate_order_path(order)
    end

    order.reload
    assert_equal "En Attente de Paiement", order.status
    assert_equal "cs_test_123", order.checkout_session_id
    assert_redirected_to new_order_payment_path(order)
  end

  test "les commandes d'invité sont rattachées au compte par email à la connexion" do
    guest_order = Order.create!(email: users(:claire).email, status: "Payée")
    assert_nil guest_order.user_id

    sign_in users(:claire)
    get creations_path

    assert_equal users(:claire).id, guest_order.reload.user_id
  end
end
