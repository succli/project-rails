class CreateRecipeCategoriesRecipeRelationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_categories_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :recipe_category, index: true
    end
  end
end
