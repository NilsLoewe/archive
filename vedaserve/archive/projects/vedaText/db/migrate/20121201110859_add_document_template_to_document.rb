class AddDocumentTemplateToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :document_template_id, :integer
  end
end
