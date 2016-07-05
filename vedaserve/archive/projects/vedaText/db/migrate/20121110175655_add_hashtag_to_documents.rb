class AddHashtagToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :hashtag, :string
  end
end
