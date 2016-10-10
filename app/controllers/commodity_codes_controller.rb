class CommodityCodesController < ApplicationController
  def index
    @results = CommodityCode.all
    render json: @results, include: params[:include]
  end

  def show
    @result = CommodityCode.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = CommodityCode.new(prms)
    if @result.save
      render json: @result
    end
  end
  
  def destroy
    @result = CommodityCode.where(id: params[:id])
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
