class CashiersController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_cashier, only: %i[show edit update destroy]
  
  # GET /cashiers or /cashiers.json
  def index
    @cashiers = Cashier.all
  end

  # GET /cashiers/1 or /cashiers/1.json
  def show; end
    
  # GET /cashiers/new
  def new
    @cashier = Cashier.new
  end

  # GET /cashiers/1/edit
  def edit; end
    
    
  
  # POST /cashiers or /cashiers.json
  def create
    @cashier = Cashier.new(cashier_params)
  
    respond_to do |format|
      if @cashier.save
        format.html { redirect_to cashier_url(@cashier), notice: "Cashier was successfully created." }
        format.json { render :show, status: :created, location: @cashier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cashier.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /cashiers/1 or /cashiers/1.json
  def update
    respond_to do |format|
      if @cashier.update(cashier_params)
        format.html { redirect_to cashier_url(@cashier), notice: "Cashier was successfully updated." }
        format.json { render :show, status: :ok, location: @cashier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cashier.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /cashiers/1 or /cashiers/1.json
  def destroy
    if @cashier.orders.count > 0
      flash[:alert] = 'Cashier can\'t deleted because it have order.'
      redirect_to cashier_path
    else  
      @cashier.destroy
      
      respond_to do |format|
        format.html { redirect_to cashiers_url, notice: "Cashier was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end
  
private
  # Use callbacks to share common setup or constraints between actions.
  def set_cashier
    @cashier = Cashier.find(params[:id])

  end

  # Only allow a list of trusted parameters through.
  def cashier_params
    params.require(:cashier).permit(:first_name, :last_name, :email, :password)
  end
end
  