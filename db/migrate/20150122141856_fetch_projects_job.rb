class FetchProjectsJob < ActiveRecord::Migration
  def change
    add_column :employees, :staffing, :text

  end
end
