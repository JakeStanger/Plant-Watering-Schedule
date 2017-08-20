class Tag < ApplicationRecord
  has_many :entries
  has_many :plants, through: :entries
end
