class PalletsController < ApplicationController
  def index
    if params[:page]
      @results = Pallet.page(params[:page][:number]).per(params[:page][:size])
    else
      @results = Pallet.limit(100)
    end

    @results = @results.includes(:zip_location, :shipping_route, :shipping_address, :purchase_positions, :purchase_orders, :pallet_type)
    @results = @results.includes(:purchase_positions)
    @results = @results.includes(line_items: [{ variant: [purchase_position: [:purchase_order, :zip_location, :commodity_code, :shipping_route]] }])

    if params[:filter]
      @results = @results.where(filters)
    end
    render json: @results, include: params[:include]
  end

  def show
    @result = Pallet.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = Pallet.new(prms)
    if @result.save
      render json: @result
    end
  end
  
  def update
    @result = Pallet.where(id: params[:id]).first!
    if @result.update_attributes(prms)
      render json: @result
    end
  end

  def destroy
    @result = Pallet.where(id: params[:id]).first
    if @result.destroy
      render json: @result
    end
  end

private
  def filters
    return Hash[params[:filter].map{ |k, v| [k.underscore, v.empty? ? nil : v] }].except("id")
    # return params.require(:filter).permit(:id).delete_if { |k, v| v.empty? }
    # return params.require(:filter).permit(:id).except(:id)
  end

  def prms
    pa = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    # params.require(data: :attributes).permit(:name)
    return pa
  end

end
