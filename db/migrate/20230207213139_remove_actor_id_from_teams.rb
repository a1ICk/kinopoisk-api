class RemoveActorIdFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :actor_id, :integer
  end
end
