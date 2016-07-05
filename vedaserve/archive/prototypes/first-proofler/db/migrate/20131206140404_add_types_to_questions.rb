class AddTypesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :research_web, :bool, :null => false, :default => false
    add_column :questions, :research_database, :bool, :null => false, :default => false
    add_column :questions, :research_library, :bool, :null => false, :default => false
    add_column :questions, :research_interview, :bool, :null => false, :default => false
  end
end
