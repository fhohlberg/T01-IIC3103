class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :tipo
      t.string :dimension
      t.text :residents
      t.string :url
      t.string :created

      t.timestamps
    end
  end
end
