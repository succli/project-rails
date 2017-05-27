class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.string :serves
      t.string :prep_time
      t.string :cooking_time
      t.string :featured_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
