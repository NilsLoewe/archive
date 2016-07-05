class CreateResearchCategories < ActiveRecord::Migration
  def change
    create_table :research_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
