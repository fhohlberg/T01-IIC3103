class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :air_date
      t.string :episode
      t.text :characters, array: true, default: []
      t.string :url
      t.string :created

      t.timestamps
    end
  end
end
