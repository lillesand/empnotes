class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :bekk_id
      t.string :name
      t.date :last_chat

      t.timestamps
    end
  end
end
