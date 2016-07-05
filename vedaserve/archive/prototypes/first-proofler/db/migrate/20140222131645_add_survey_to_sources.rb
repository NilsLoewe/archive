class AddSurveyToSources < ActiveRecord::Migration
  def change
    add_column :sources, :Survey, :boolean
  end
end
