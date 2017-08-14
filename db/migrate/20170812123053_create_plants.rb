class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name # Scientific name
      t.string :common_names # Common names

      t.integer :watering_time # In hours
      t.integer :sunlight_exposure # Categoric value 0-5

      t.integer :summer_environment # Categoric value 0-2
      t.integer :winter_environment # Categoric value 0-2

      t.text :description
      t.string :info_link

      t.timestamps
    end
  end
end
