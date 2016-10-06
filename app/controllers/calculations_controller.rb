class CalculationsController < ApplicationController
  def index
    @results = Calculation.limit(100)
    render json: @results, include: params[:include]
  end

  def show
    @result = Calculation.where(id: params[:id]).first!
    render json: @result, include: params[:include]
  end
  
  def create
    puts prms
    @result = Calculation.new(prms)
    
    # if @result.save
    #   render json: @result
    # end
    render json: @result
  end
  
  def destroy
    @result = Calculation.where(id: params[:id])
    if @result.destroy
      render json: @result
    end
  end

private

  def prms
    res = ActiveModelSerializers::Deserialization.jsonapi_parse(params, polymorphic: [:calculable])
    res[:calculable_type] = res[:calculable_type].singularize.underscore.camelize
    return res
  end
end
