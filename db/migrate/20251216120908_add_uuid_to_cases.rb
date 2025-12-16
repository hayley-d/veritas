class AddUuidToCases < ActiveRecord::Migration[8.0]
  def change
    add_column :cases, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_index  :cases, :uuid, unique: true
  end
end
