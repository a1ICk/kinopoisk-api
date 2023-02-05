# frozen_string_literal: true

class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :count_of_films
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
