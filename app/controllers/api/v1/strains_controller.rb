class Api::V1::StrainsController < ApplicationController
  before_action :set_strain, only: %i[ show update destroy ]

  # GET /strains
  def index
    @strains = Strain.all

    render json: @strains
  end

  # GET /strains/1
  def show
    render json: @strain
  end

  # POST /strains
  def create
    @strain = Strain.new(strain_params)

    if @strain.save
      render json: @strain, status: :created, location: @strain
    else
      render json: @strain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /strains/1
  def update
    if @strain.update(strain_params)
      render json: @strain
    else
      render json: @strain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /strains/1
  def destroy
    @strain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strain
      @strain = Strain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def strain_params
      params.require(:strain).permit(:name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount, :type_id)
    end
end
