# A plant. Each instance holds properties true across all copies of that plant.
class Plant < ApplicationRecord
  has_many :entries
  has_many :tags, through: :entries
  has_many :user_plants

  def tag_list
    string = ''
    tags.each { |t| string += "#{t.name}, " }
    string
  end
end
