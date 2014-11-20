class WinesController < ApplicationController
  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])

    if @wine.update_attributes(wine_params)
      redirect_to wines_path, notice: 'Wine was successfully updated.'
    end
  end

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to wines_path, notice: 'Wine was successfully added.'
    end
  end


  private

  def wine_params
    params.require(:wine).permit(:name, :wine_type, :url, :retail_price_in_dollars)
  end
end
