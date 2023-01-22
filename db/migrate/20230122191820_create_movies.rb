class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.integer :release_date
      t.string :genre
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
