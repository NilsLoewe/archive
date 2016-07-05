class CreateDocumentTemplateTable < ActiveRecord::Migration
  def up
    create_table :document_templates do |t|
      t.string :name
      t.string :filename
    end
  end

  def down
    drop_table :document_templates
  end
end
