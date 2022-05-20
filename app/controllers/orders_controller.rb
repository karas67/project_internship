class OrdersController < ApplicationController
  before_action :order, only: %i[show edit update destroy]
  before_action :prepare_variables, only: %i[create edit new update]
  
  def index
    @orders = Order.all.page params[:page]
  end

  def show
    @cashier = @order.cashier
  end

  def new
    @order = Order.new
    @details = Detail.all
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def prepare_variables
    @cashiers = Cashier.all
  end

  def order
    @order ||= Order.find(params.permit(:id)[:id].to_i)
  end

  def order_params
    params.require(:order).permit(:cashier_id, :date, :name, :amount)
  end
end