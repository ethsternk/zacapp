class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
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

  # def edit
  #   @payment = Payment.find(params[:id])
  # end

  # def update
  #   payment = Payment.find(params[:id])

  #   if payment.update(contact_params)
  #     redirect_to contact
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  private
    def payment_params
      params.require(:payment).permit(:advanced_amount, :deducted_from_bl, :amount_deducted, :total_rebate)
    end
end
