class OrderDetailsController < ApplicationController
  before_action :order_detail, only: %i[show edit update destroy]

  def index
    @order_details = OrderDetail.all
  end

  def show; end

  def new
    @order_detail = OrderDetail.new
  end

  def edit; end

  def create
    @order_detail = OrderDetail.new(order_detail_params)

    respond_to do |format|
      if @order_detail.save
        format.html { redirect_to order_detail_url(@order_detail), notice: "OrderDetail was successfully created." }
        format.json { render :show, status: :created, location: @order_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to order_detail_url(@order_detail), notice: "OrderDetail was successfully updated." }
        format.json { render :show, status: :ok, location: @order_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_detail.destroy

    respond_to do |format|
      format.html { redirect_to order_details_url, notice: "OrderDetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def order_detail
    @order_detail ||= OrderDetail.find(params.permit(:id)[:id].to_i)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :detail_id, :amount, :quantity)
  end
end