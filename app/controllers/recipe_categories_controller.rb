class RecipeCategoriesController < ApplicationController

  def index
    @recipe_categories = RecipeCategory.order('posts.created_at DESC').paginate(page: params[:page])
  end

  def show
    @recipe_category = RecipeCategory.find(params[:id])
    @recipes = @recipe_category.recipe_ids
  end

end
