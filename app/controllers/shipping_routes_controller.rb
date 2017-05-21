class ShippingRoutesController < ApplicationController
  def index
    @results = ShippingRoute.all.order('name ASC')
    render json: @results, include: params[:include]
  end

  def show
    @result = ShippingRoute.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = ShippingRoute.new(prms)
    if @result.save
      render json: @result
    end
  end
  
  def destroy
    @result = ShippingRoute.where(id: params[:id])
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
