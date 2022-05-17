class User < ApplicationRecord
    has_secure_password

    has_many :strains
    validates :email, uniqueness: true, presence: true
end
