class Ingredient < ApplicationRecord
  enum ingredient_type: [:grains, :hops, :adjuncts]
  has_many :recipes, through: :recipe_ingredients
end
