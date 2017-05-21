class CargoListsController < ApplicationController
  def index
    if params[:page]
      @results = CargoList.page(params[:page][:number]).per(params[:page][:size])
    else
      @results = CargoList.all
    end
    if params[:filter]
      @results = @results.where(filters)
    end

    @results = @results.order("id DESC").includes(:shipper)
    @results = @results.includes(pallets: [:pallet_type, :shipping_route, :zip_location, :purchase_orders, :purchase_positions, :line_items, :shipping_address])
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

  def filters
    # return Hash[params[:filter].map{ |k, v| [k.underscore, v.empty? ? nil : v] }]
    return params.require(:filter).permit(:id).delete_if { |k, v| v.empty? }
  end

  def prms
    pa = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    # params.require(data: :attributes).permit(:name)
    return pa
  end
end
