class ChangeDataTypeForDocumentPartType < ActiveRecord::Migration
  def up
    change_table :document_parts do |t|
      t.change :type, :string
    end
  end

  def down
    change_table :document_parts do |t|
      t.change :type, :integer
    end
  end
end
