class AddDescToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :description, :string
    add_column :decisions, :email, :string
    add_column :decisions, :author, :string
  end
end
