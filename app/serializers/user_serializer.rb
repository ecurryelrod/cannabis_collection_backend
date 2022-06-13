# class UserSerializer < ActiveModel::Serializer
#   attributes :id, :email, :password_digest
# end

class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :name
  # has_many :strains

  attribute :strains do |user|
    user.strains.map do |strain| 
      {
        id: strain.id,
        name: strain.name,
        description: strain.description,
        terpene: strain.terpene,
        thc_amount: strain.thc_amount,
        cbd_amount: strain.cbd_amount,
        cbg_amount: strain.cbg_amount,
        effects: strain.effects.map do |effect| 
            {
              id: effect.id,
              name: effect.name
            }
        end,
        type: {
          id: strain.type.id,
          name: strain.type.name
        }
      }
    end
  end

  # attribute :effects do |strain|
  #   strain.effects.map do |effect| 
  #       {
  #         id: effect.id,
  #         name: effect.name
  #       }
  #   end
  # end
end
