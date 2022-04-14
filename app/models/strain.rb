class Strain < ApplicationRecord
  belongs_to :type
  has_many :effects
end
