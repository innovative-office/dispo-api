class PalletsController < ApplicationController
  def index
    @results = Pallet.limit(100)
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

  def prms
    pa = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    # params.require(data: :attributes).permit(:name)
    return pa
  end

end
