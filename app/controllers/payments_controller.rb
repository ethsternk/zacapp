class PaymentsController < ApplicationController
  def new
    @contact = Contact.find(params[:contact_id])
    @payment = @contact.payments.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @payment = @contact.payments.create(payment_params)
    @payment.payment_date = Date.today

    if @payment.save
      redirect_to contact_path(@contact)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @contact = Contact.find(params[:contact_id])
    @payment = @contact.payments.find(params[:id])
  end

  def update
    contact = Contact.find(params[:contact_id])
    payment = contact.payments.create(payment_params)
    payment.payment_date = Date.today

    if payment.update(payment_params)
      redirect_to contact
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @payment = @contact.payments.find(params[:id])

    @payment.destroy

    redirect_to contact_path(@contact)
  end

  private
    def payment_params
      params.require(:payment).permit(:advanced_amount, :deducted_from_bl, :amount_deducted, :total_rebate)
    end
end
