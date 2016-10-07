class PurchasePositionsController < ApplicationController
  def index
    @results = PurchasePosition.includes(:zip_location, purchase_order: [:calculation, :purchase_positions, :pallets, :shipping_route, :shipping_address]).limit(100)
    render json: @results, include: params[:include]
  end

  def show
    @result = PurchasePosition.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = PurchasePosition.new(prms)
    if @result.save
      render json: @result
    end
  end

  def update
    @result = PurchasePosition.where(id: params[:id]).first!
    if @result.update_attributes(prms)
      render json: @result
    end
  end

  def destroy
    @result = PurchasePosition.where(id: params[:id])
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
