class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.integer :movie_id
      t.datetime :date
      t.integer :format_id
      t.integer :rating
      t.text :notes

      t.timestamps
    end
  end
end
