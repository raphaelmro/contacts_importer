class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @contacts = Contact.where(user_id: current_user.id)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path, status: :created, notice: "The contact has been created."
    else
      render new_contact_path, status: :unprocessable_entity
    end

  end


  private
  def contact_params
    params.require(:contact).permit(:name ,:birth_date, :phone, :address ,
                                    :credit_card, :franchise, :cc_last_digits, :email)
  end
end
