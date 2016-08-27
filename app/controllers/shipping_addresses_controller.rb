class ShippingAddressesController < ApplicationController
  def index
    @results = Address.limit(100)
    render json: @results, include: params[:include]
  end

  def show
    @result = Address.where(id: params[:id]).first!
    render json: @result, include: params[:include], serializer: ShippingAddressSerializer
  end
  
  def create
    @result = Address.new(prms)
    if @result.save
      render json: @result
    end
  end
  
  def destroy
    @result = Address.where(id: params[:id])
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
