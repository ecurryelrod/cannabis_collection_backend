class Api::V1::EffectsController < ApplicationController
  before_action :set_effect, only: %i[ show update destroy ]

  # GET /effects
  def index
    @effects = Effect.all

    render json: @effects
  end

  # GET /effects/1
  def show
    render json: @effect
  end

  # POST /effects
  def create
    @effect = Effect.new(effect_params)

    if @effect.save
      render json: @effect, status: :created, location: @effect
    else
      render json: @effect.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /effects/1
  def update
    if @effect.update(effect_params)
      render json: @effect
    else
      render json: @effect.errors, status: :unprocessable_entity
    end
  end

  # DELETE /effects/1
  def destroy
    @effect.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_effect
      @effect = Effect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def effect_params
      params.require(:effect).permit(:name)
    end
end
