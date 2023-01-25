class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :kp
      t.float :imdb
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
