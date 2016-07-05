class AddConfiguredResearchCategoriesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :configured_research_categories, :text, default: nil
  end
end
