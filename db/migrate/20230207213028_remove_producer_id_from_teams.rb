class RemoveProducerIdFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :producer_id, :integer
  end
end
