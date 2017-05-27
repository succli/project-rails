class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.order('recipes.created_at DESC').paginate(page: params[:page])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)
    if @recipe.save
      flash[:success] = "Receptjék sikeresen mentettük!"
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(post_params)
      flash[:success] = 'Recept frissítve.'
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @lastrecipes = Recipe.order('recipes.created_at DESC').limit(5)
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recept törölve."
    redirect_to recipes_url
  end

  private

    def post_params
      params.require(:recipe).permit(:title, :description, :ingredients, :serves, :prep_time, :cooking_time, :featured_image, :user_id, {:recipe_category_ids => []})
    end
end
