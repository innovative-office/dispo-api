class PurchasePositionsController < ApplicationController
  def index
    @results = PurchasePosition.includes(:commodity_code, :shipping_route, :zip_location).limit(100)
    @results = @results.includes(purchase_order: [:calculation, :purchase_positions, :pallets, :shipping_route, :shipping_address])

    if params[:filter]
      @results = @results.where(filter_prms)
    end
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

  def filter_prms
    return params.require(:filter).permit(:baan_id).delete_if { |k, v| v.empty? }
  end
end
