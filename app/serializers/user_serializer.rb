# class UserSerializer < ActiveModel::Serializer
#   attributes :id, :email, :password_digest
# end

class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :name
  # has_many :strains

  attribute :strains do |type|
    type.strains.map do |strain| 
        {
          id: strain.id,
          name: strain.name,
          description: strain.description,
          terpene: strain.terpene,
          thc_amount: strain.thc_amount,
          cbd_amount: strain.cbd_amount,
          cbg_amount: strain.cbg_amount
        }
    end
  end
end
