class Api::V1::TypesController < ApplicationController
  before_action :set_type, only: %i[ show ]

  def index
    @types = Type.all

    render json: TypeSerializer.new(@types)
    # render json: @types
  end

  def show
    render json: TypeSerializer.new(@type)
    # render json: @type
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name)
    end
end
