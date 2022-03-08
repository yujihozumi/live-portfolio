class AddColumnsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :live_venue, :string
    add_column :posts, :artist, :string
    add_column :posts, :start_time, :time
    add_column :posts, :ending_time, :time
    add_column :posts, :start_date, :date
    add_column :posts, :end_date, :date
  end
end
