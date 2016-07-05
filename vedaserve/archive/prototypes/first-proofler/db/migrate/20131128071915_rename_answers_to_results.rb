class RenameAnswersToResults < ActiveRecord::Migration
  def up
    rename_table :answers, :results
  end

  def down
    rename_table :results, :answers
  end
end
