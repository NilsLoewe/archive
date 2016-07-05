class CreateWebSearchResult < ActiveRecord::Migration
  def change
    create_table(:web_search_results) do |t|
      t.integer :question_id
      t.string :content
      t.string :keywords
      t.string :url
      t.timestamps
    end
  end
end
