class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :plant, index: true

      t.timestamps
    end
  end
end
