class ContactMailer < ApplicationMailer
  def new_contact_email
    @contact = params[:contact]
    mail(to: ENV["OVH_EMAIL"], subject: "Solstice Fleuriste : Nouveau formulaire de contact")
  end
end
