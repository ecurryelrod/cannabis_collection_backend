class Api::V1::TypesController < ApplicationController
  before_action :set_type, only: %i[ show update destroy ]

  def index
    @types = Type.all

    render json: @types
  end

  def show
    render json: @type
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name)
    end
end
