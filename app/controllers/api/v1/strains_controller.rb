class Api::V1::StrainsController < ApplicationController
  before_action :set_strain, only: %i[ show update destroy ]

  def index
    @strains = Strain.all
    
    # if logged_in?
      # @strains = current_user.strains
      render json: StrainSerializer.new(@strains)
    # else
      # render json: {alert: "You must be logged in to see your experiences"}
    # end

    # render json: StrainSerializer.new(@strains)
    # render json: @strains
  end

  def show
    render json: StrainSerializer.new(@strain)
    # render json: @strain
  end

  def create
    @strain = Strain.new(strain_params)
    # @strain = current_user.strains.build(strain_params)
    # effect_ids gotten from createStrain action, sendableData variable.
    # by setting strain.effect_ids = to params[:effect_ids],
    # able to add effects to @strain.effects array due to model associations/join table.
    @strain.effect_ids = params[:effect_ids]

    if @strain.save
      render json: StrainSerializer.new(@strain), status: :created
    else
      render json: {error: @strain.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def update
    @strain.effect_ids = params[:effect_ids]

    if @strain.update(strain_params)
      render json: StrainSerializer.new(@strain)
    else
      render json: @strain.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # need to delete all join table associations before @strain object can be deleted
    StrainEffect.all.where(strain_id: @strain.id).each do |strain|
      strain.destroy
    end
    @strain.destroy
  end

  private
    def set_strain
      @strain = Strain.find(params[:id])
    end

    def strain_params
      params.require(:strain).permit(:name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount, :type_id, :user_id)
    end
end
