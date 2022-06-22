class Strain < ApplicationRecord
  belongs_to :type
  belongs_to :user
  has_many :strain_effects
  has_many :effects, through: :strain_effects

  validates_presence_of :name, :description, :terpene, :thc_amount, :cbd_amount, :cbg_amount, :type, :effects
end
