class Strain < ApplicationRecord
  belongs_to :type
  has_many :strain_effects
  has_many :effects, through: :strain_effects
end
