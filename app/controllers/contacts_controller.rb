class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.with(contact: @contact).new_contact_email.deliver_later
      redirect_to root_path, notice: 'Votre message a bien été envoyé !'
    else
      render :new, notice: 'Ooops, il y a eu un problème !'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :first_name, :last_name, :email, :phone, :address, :message)
  end
end
