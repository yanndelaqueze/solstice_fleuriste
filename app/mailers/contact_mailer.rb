class ContactMailer < ApplicationMailer
  def new_contact_email
    @contact = params[:contact]
    # mail(to: ENV["GMAIL_EMAIL"], subject: "Nouveau Formulaire de Contact")
    # Test email
    mail(to: @contact.email, subject: "TEST EMAIL SOLSTICE")
  end
end
