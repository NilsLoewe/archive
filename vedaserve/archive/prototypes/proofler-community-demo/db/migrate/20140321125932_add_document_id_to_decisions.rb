class AddDocumentIdToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :document_id, :integer
  end
end
