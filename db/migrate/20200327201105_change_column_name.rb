class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :type, :tipo
  end
end
