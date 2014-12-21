class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note
      t.datetime :created_at
      t.references :employee

      t.timestamps
    end
  end
end
