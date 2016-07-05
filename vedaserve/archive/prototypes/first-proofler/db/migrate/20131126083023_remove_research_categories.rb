class RemoveResearchCategories < ActiveRecord::Migration
  def change
    drop_table :research_categories
  end
end
