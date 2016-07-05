class Drop < ActiveRecord::Migration
  def up
    drop_table :faqs
  end

  def down
  end
end
