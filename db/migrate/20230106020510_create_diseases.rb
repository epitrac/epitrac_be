class CreateDiseases < ActiveRecord::Migration[5.2]
  def change
    create_table :diseases do |t|
      t.string :disease
      t.string :information
      t.string :link
    end
  end
end
