class AddInvitationTokenToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :invitation_token, :string
  end
end
