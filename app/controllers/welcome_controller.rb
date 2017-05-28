class WelcomeController < ApplicationController
  def index
    @recipes = Recipe.order('recipes.created_at DESC').limit(3)
  end
end
