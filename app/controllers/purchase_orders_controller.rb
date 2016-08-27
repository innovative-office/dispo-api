class PurchaseOrdersController < ApplicationController
  def index
    @results = PurchaseOrder.includes(:purchase_positions, :shipping_route, :shipping_address).limit(100)
    render json: @results, include: params[:include]
  end

  def show
    @result = PurchaseOrder.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = PurchaseOrder.new(prms)
    if @result.save
      render json: @result
    end
  end
  
  def destroy
    @result = PurchaseOrder.where(id: params[:id])
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
