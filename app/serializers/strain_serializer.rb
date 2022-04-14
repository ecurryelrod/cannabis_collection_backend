class StrainSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount
  has_one :type
end
