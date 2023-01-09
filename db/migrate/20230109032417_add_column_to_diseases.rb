class AddColumnToDiseases < ActiveRecord::Migration[5.2]
  def change
    add_column :diseases, :short_name, :string 
  end
end
