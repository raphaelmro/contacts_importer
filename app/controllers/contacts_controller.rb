class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "The contact has been created."
    else
      redirect_to contacts_path, error: "The contact could not be created."
    end

  end


  private
  def contact_params
    params.require(:contact).permit(:name ,:birth_date, :phone, :address ,:credit_card, :franchise, :email)
  end
end
