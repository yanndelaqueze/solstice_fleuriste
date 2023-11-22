# class StripeCheckoutSessionService
#   def call(event)
#     order = Order.find_by(checkout_session_id: event.data.object.id)
#     order.update(status: 'Payée')
#     OrderMailer.with(order: @order).new_order_email.deliver_later
#     OrderMailer.with(order: @order).order_confirmation_email.deliver_later
#   end
# end
