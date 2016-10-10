class CargoListsController < ApplicationController
  def index
    @results = CargoList.order("id DESC").includes(:shipper, pallets: [:pallet_type, :shipping_route, :zip_location]).limit(500)
    render json: @results, include: params[:include]
  end

  def show
    @result = CargoList.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = CargoList.new(prms)
    if @result.save
      render json: @result
    end
  end
  
  def destroy
    @result = CargoList.where(id: params[:id])
    if @result.destroy
      render json: @result
    end
  end

private

  def prms
    pa = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    # params.require(data: :attributes).permit(:name)
    return pa
  end
end
