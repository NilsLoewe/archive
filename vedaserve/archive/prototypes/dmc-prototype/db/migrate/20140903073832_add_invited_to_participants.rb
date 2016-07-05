class AddInvitedToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :invited, :boolean
  end
end
