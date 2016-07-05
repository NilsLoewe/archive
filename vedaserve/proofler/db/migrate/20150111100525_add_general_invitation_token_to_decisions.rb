class AddGeneralInvitationTokenToDecisions < ActiveRecord::Migration
  def change
    add_column :decisions, :general_invitation_token, :string
  end
end
