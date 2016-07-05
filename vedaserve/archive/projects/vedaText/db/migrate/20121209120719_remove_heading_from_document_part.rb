class RemoveHeadingFromDocumentPart < ActiveRecord::Migration
  def up
    remove_column :document_parts, :heading
  end

  def down
    add_column :document_parts, :heading, :text
  end
end
