class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :status
      t.string :species
      t.string :type
      t.string :gender
      t.text :origin
      t.text :location
      t.string :image
      t.text :episode, array: true, default: []
      t.string :url
      t.string :created

      t.timestamps
    end
  end
end
