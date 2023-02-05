# frozen_string_literal: true

class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.integer :experience
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
