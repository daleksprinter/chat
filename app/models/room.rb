class Room < ApplicationRecord
    has_many :joins, dependent: :destroy
    has_many :joins, dependent: :destroy
    has_many :messages, dependent: :destroy
end
