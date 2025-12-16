class CreateEvidence < ActiveRecord::Migration[8.0]
  def change
    create_table :evidences, id: :uuid do |t|
      t.references :case, null: false, foreign_key: true

      t.string :name
      t.text :description
      t.string :status
      t.string  :original_filename, null: false
      t.string  :mime_type, null: false
      t.bigint  :size_bytes, null: false
      t.string  :sha256, null: false

      t.string  :file_type, null: false
      t.integer :mode, null: false
      t.integer :uid, null: false
      t.integer :gid, null: false
      t.bigint  :inode
      t.integer :nlink
      t.datetime :atime
      t.datetime :mtime
      t.datetime :ctime

      t.timestamps
    end

    add_index :evidences, :sha256
  end
end
