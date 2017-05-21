class PurchaseOrdersController < ApplicationController
  def index
    if params[:page]
      @results = PurchaseOrder.page(params[:page][:number]).per(params[:page][:size])
    else
      @results = PurchaseOrder.all
    end
    if params[:filter]
      @results = @results.where(filter_prms)
    end
    @results = @results.includes(:pallets, :shipping_route, :shipping_address, calculation: [:calculable])
    @results = @results.includes(purchase_positions: [:zip_location, :purchase_order, :commodity_code, :shipping_route])

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

  def update
    @result = PurchaseOrder.where(id: params[:id]).first!
    if @result.update_attributes(prms)
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
    res = ActiveModelSerializers::Deserialization.jsonapi_parse(params, except: [:calculation])
    # params.require(data: :attributes).permit(:name)
    return res
  end

  def filter_prms
    return params.require(:filter).permit(:baan_id, :delivered, :shipping_route_id).delete_if { |k, v| v.empty? }
  end
end
