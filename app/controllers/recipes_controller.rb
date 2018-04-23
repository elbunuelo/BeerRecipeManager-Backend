class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = current_user.recipes.all

    render json: @recipes, include: [:recipe_ingredients]
  end

  # GET /recipes/1
  def show
    render json: @recipe, include: [:recipe_ingredients]
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      render json: @recipe, include: [:recipe_ingredients], status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe, include: [:recipe_ingredients]
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe)
        .permit(
          :name, :mash_time, :mash_temperature, :boil_time, :notes,
          recipe_ingredients_attributes: [:ingredient_id, :amount, :unit])
    end
end
