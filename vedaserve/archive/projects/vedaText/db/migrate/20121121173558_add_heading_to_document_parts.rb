class AddHeadingToDocumentParts < ActiveRecord::Migration
  def change
    add_column :document_parts, :heading, :text
  end
end
