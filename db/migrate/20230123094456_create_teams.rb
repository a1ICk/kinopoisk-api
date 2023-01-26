class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.bigint :producer_id
      t.bigint :actor_id
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
c