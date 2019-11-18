class ChangeColumnNameToToilets < ActiveRecord::Migration[5.2]
  def change
    rename_column :toilets, :type, :toilet_type
  end
end
