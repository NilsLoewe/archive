class DropResultsTables < ActiveRecord::Migration
  def up
    drop_table :web_search_results
    drop_table :database_search_results
    drop_table :library_search_results
    drop_table :interview_results
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
