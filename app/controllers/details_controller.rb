class DetailsController < ApplicationController
  before_action :detail, only: %i[show edit update destroy]

  def index
    if params[:name]
      @details = Detail.where('name ILIKE ?', "%#{params[:name]}%") #case-insensitive
    else
      @details = Detail.all
    end
  end

  def show; end

  def new
    @detail = Detail.new
  end

  def edit; end

  def create
    @detail = Detail.new(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to detail_url(@detail), notice: "Detail was successfully created." }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to detail_url(@detail), notice: "Detail was successfully updated." }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url, notice: "Detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def detail
    @detail ||= Detail.find(params.permit(:id)[:id].to_i)
  end

  def detail_params
    params.require(:detail).permit(:name, :price, :quantity)
  end
end


