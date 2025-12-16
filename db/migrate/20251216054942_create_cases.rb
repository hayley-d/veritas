class CreateCases < ActiveRecord::Migration[8.0]
  def change
    create_table :cases do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :phase
      t.uuid :created_by

      t.timestamps
    end
  end
end
