class CreateLibrarySearchResult < ActiveRecord::Migration
  def change
    create_table(:library_search_results) do |t|
      t.integer :question_id
      t.string :content
      t.string :keywords
      t.timestamps
    end
  end
end
