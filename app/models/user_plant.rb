class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  def start_time
    last_watered.to_date + plant.watering_time.days
  end

end
