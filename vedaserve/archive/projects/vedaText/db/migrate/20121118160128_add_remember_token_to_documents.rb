class AddRememberTokenToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :remember_token, :string
    add_index  :documents, :remember_token
  end
end
