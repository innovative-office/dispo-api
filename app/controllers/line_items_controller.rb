class LineItemsController < ApplicationController
  def index
    @results = PalletPurchasePositionAssignment.limit(100)
    render json: @results, include: params[:include]
  end

  def show
    @result = PalletPurchasePositionAssignment.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @purchase_position = PurchasePosition.where(id: prms[:purchase_position_id]).first

    @pallet = Pallet.where(id: prms[:pallet_id]).first

    @variant = Variant.new(purchase_position: @purchase_position)

    @line_item = @pallet.line_items.build(prms)
    @line_item.pallet = @pallet
    @line_item.variant = @variant

    @purchase_position.available_quantity -= @line_item.quantity

    if @line_item.save
      @purchase_position.save
      render json: @line_item, include: 'pallet, variant.purchase_position', serializer: LineItemSerializer
    end
  end
  
  def update
    @result = PalletPurchasePositionAssignment.where(id: params[:id]).first!
    @purchase_position = @result.variant.purchase_position

    @result.attributes = prms

    if @result.quantity > @result.quantity_was
      @purchase_position.available_quantity -= 1
    elsif @result.quantity < @result.quantity_was
      @purchase_position.available_quantity += 1
    end

    if @result.save
      @purchase_position.save

      render json: @result, serializer: LineItemSerializer
    end
  end

  def destroy
    @result = PalletPurchasePositionAssignment.where(id: params[:id]).first
    if @result.destroy
      render json: @result, serializer: LineItemSerializer
    end
  end

private

  def prms
    pa = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    # params.require(data: :attributes).permit(:name)
    return pa
  end
end
