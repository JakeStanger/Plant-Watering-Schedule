class CreateUserPlants < ActiveRecord::Migration[5.1]
  def change
    create_table :user_plants do |t|
      t.references :plant
      t.references :user
      t.string :custom_name
      t.text :notes
      t.datetime :last_watered

      t.timestamps
    end
  end
end
