class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :skandies_year
      t.string :title_index
      t.string :director
      t.boolean :short

      t.timestamps
    end
    add_index :movies, :year
    add_index :movies, :skandies_year
  end
end
