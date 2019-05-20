class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular

  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def users
    recipecards.map do |recipecard|
      recipecard.user
    end
  end

  def recipeingredients
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
  end

  def ingredients
    recipeingredients.map do |recipeingredient|
      recipeingredient.ingredient
    end
  end

  def allergens
    ingredients.select do |ingredient|
      num_allergies = ingredient.allergies.size
    #  binding.pry
      num_allergies != 0
    #  binding.pry
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end
end
