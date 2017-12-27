class CreateViewCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :view_counts do |t|
      t.integer :count
      t.string :movie_references

      t.timestamps
    end
  end
end
