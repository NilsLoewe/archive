class AddDecisionIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :decision_id, :integer
  end
end
