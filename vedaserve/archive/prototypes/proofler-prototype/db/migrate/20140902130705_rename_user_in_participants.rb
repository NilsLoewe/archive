class RenameUserInParticipants < ActiveRecord::Migration
  def change
    rename_column :participants, :used_id, :user_id
  end
end
