class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note
      t.datetime :added_at
      t.string :happiness
      t.references :employee, index: true

      t.timestamps
    end
  end
end
