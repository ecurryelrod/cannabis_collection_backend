class Strain < ApplicationRecord
  belongs_to :type
  belongs_to :user
  has_many :strain_effects
  has_many :effects, through: :strain_effects
end
