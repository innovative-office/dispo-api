class VariantsController < ApplicationController
  def index
    @results = Variant.limit(100)
    render json: @results, include: params[:include]
  end

  def show
    @result = Variant.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    @result = Variant.new(prms)
    if @result.save
      render json: @result
    end
  end

  def update
    @result = Variant.where(id: params[:id]).first!
    if @result.update_attributes(prms)
      render json: @result
    end
  end

  def destroy
    @result = Variant.where(id: params[:id])
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
