class Api::V1::StrainsController < ApplicationController
  before_action :set_strain, only: %i[ show update destroy ]

  def index
    @strains = Strain.all

    render json: StrainSerializer.new(@strains)
    # render json: @strains
  end

  def show
    render json: StrainSerializer.new(@strain)
    # render json: @strain
  end

  def create
    @strain = Strain.new(strain_params)

    if @strain.save
      render json: @strain, status: :created, location: @strain
    else
      render json: @strain.errors, status: :unprocessable_entity
    end
  end

  def update
    if @strain.update(strain_params)
      render json: @strain
    else
      render json: @strain.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @strain.destroy
  end

  private
    def set_strain
      @strain = Strain.find(params[:id])
    end

    def strain_params
      params.require(:strain).permit(:name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount, :type_id)
    end
end
