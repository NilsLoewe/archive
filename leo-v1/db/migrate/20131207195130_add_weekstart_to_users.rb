class AddWeekstartToUsers < ActiveRecord::Migration
  def change
    add_column :users, :week_start, :datetime
  end
end
