class CreateDocumentParts < ActiveRecord::Migration
  def change
    create_table :document_parts do |t|
      t.text :content
      t.integer :type
      t.integer :document_id

      t.timestamps
    end
  end
end
