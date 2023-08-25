class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
    @payments = @contact.payments.sort_by(&:payment_date).reverse
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      redirect_to contact
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    render :show, status: :unprocessable_entity unless @contact.payments.empty?

    @contact.destroy

    redirect_to contacts_path, status: :see_other
  end

  private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :address, :city, :state_or_province, :postal_code, :home_phone, :mobile_phone, :notes, :paid_in_full, :email)
    end
end
