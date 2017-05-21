class PalletTypesController < ApplicationController
  def index
    if params[:page]
      @results = PalletType.page(params[:page][:number]).per(params[:page][:size])
    else
      @results = PalletType.all
    end

    render json: @results, include: params[:include]
  end

  def show
    @result = PalletType.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = PalletType.new(prms)
    if @result.save
      render json: @result
    end
  end

  def update
    @result = PalletType.where(id: params[:id]).first!
    if @result.update_attributes(prms)
      render json: @result
    end
  end

  def destroy
    @result = PalletType.where(id: params[:id])
    if @result.destroy
      render json: @result
    end
  end

private

  def prms
    res = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    return res
  end
end
