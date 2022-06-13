# class StrainSerializer < ActiveModel::Serializer
#   attributes :id, :name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount
#   belongs_to :type
#   has_many :effects
# end

class StrainSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount
  # belongs_to :type, serializer: TypeSerializer
  # has_many :effects, serializer: EffectSerializer

  attribute :type do |strain|
    {
      id: strain.type.id,
      name: strain.type.name
    }
  end

  attribute :effects do |strain|
    strain.effects.map do |effect| 
        {
          id: effect.id,
          name: effect.name
        }
    end
  end

  attribute :user do |strain|
    {
      id: strain.user.id,
      name: strain.user.name,
      email: strain.user.email
    }
  end
end

