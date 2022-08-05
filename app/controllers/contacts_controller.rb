class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_param(:name, :address, :phone, :email))
    @contact.save
    redirect_to contacts_path
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_param(:name, :address, :phone, :email))
    redirect_to contacts_path
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  private

  def contact_param(*args)
    params.require(:contact).permit(*args)
  end

end
