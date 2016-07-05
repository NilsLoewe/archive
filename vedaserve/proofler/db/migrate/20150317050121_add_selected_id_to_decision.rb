class AddSelectedIdToDecision < ActiveRecord::Migration
  def change
    add_column :decisions, :selected_id, :integer
  end
end
