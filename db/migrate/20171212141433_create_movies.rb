class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :plot
      t.string :image
      t.float :rating
      t.string :web

      t.timestamps
    end
  end
end
