# Preview http://localhost:3000/rails/mailers/order_mailer/new_order_email
# Preview http://localhost:3000/rails/mailers/order_mailer/order_ready_email
# Preview http://localhost:3000/rails/mailers/order_mailer/order_confirmation_email

class OrderMailerPreview < ActionMailer::Preview
  def new_order_email
    order = Order.first
    OrderMailer.with(order: order).new_order_email
  end

  def order_ready_email
    order = Order.first
    OrderMailer.with(order: order).order_ready_email
  end

  def order_confirmation_email
    order = Order.first
    OrderMailer.with(order: order).order_confirmation_email
  end
end
