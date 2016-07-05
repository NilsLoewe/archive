class RemoveFieldsFromFacts < ActiveRecord::Migration
  def change
    remove_column :facts, :option_id
    remove_column :facts, :content
    remove_column :facts, :link
    remove_column :facts, :source
    remove_column :facts, :question
    remove_column :facts, :old
    remove_column :facts, :chosen
    remove_column :facts, :inverse
  end
end
