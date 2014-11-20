class Api::V1::WinesController < Api::V1::ApplicationController

  def index
    wines = Wine.all
    render json: wines
  end

  def update
    wine = Wine.find_by_id(params[:id])

    if wine
      wine.update_attributes(wine_params)
      render json: {message: 'Wine was successfully updated.', wine: wine}, status: 200
    else
      render json: {message: 'Wine not found.'}, status: 400
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :wine_type, :url, :retail_price)
  end
end
