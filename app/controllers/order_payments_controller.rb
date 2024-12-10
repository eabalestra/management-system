class OrderPaymentsController < ApplicationController
  before_action :set_order_payment, only: %i[ show edit update destroy ]

  # GET /order_payments or /order_payments.json
  def index
    @order_payments = OrderPayment.all
  end

  # GET /order_payments/1 or /order_payments/1.json
  def show
  end

  # GET /order_payments/new
  def new
    @order_payment = OrderPayment.new
  end

  # GET /order_payments/1/edit
  def edit
  end

  # POST /order_payments or /order_payments.json
  def create
    @order_payment = OrderPayment.new(order_payment_params)

    respond_to do |format|
      if @order_payment.save
        format.html { redirect_to order_payment_url(@order_payment), notice: "Order payment was successfully created." }
        format.json { render :show, status: :created, location: @order_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_payments/1 or /order_payments/1.json
  def update
    respond_to do |format|
      if @order_payment.update(order_payment_params)
        format.html { redirect_to order_payment_url(@order_payment), notice: "Order payment was successfully updated." }
        format.json { render :show, status: :ok, location: @order_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_payments/1 or /order_payments/1.json
  def destroy
    @order_payment.destroy!

    respond_to do |format|
      format.html { redirect_to order_payments_url, notice: "Order payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_payment
      @order_payment = OrderPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_payment_params
      params.require(:order_payment).permit(:amount, :payment_method, :paid_at, :order_id)
    end
end
