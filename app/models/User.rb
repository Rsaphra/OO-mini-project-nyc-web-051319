class User
  attr_accessor :name, :most_recent
  @@all = []

  def initialize(name)
    @name = name
    @most_recent = nil
    @@all << self
  end

  def self.all
    @@all
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    get_recipes(recipecards)
  end

  def get_recipes(recipecard_list)
    recipecard_list.map do |recipecard|
      recipecard.recipe
    end
  end

  def allergens
    Allergy.all.select do |allergy|
      allergy.user == self
    end
  end

  def allergic_ingredients
    allergens.map do |allergy|
      allergy.ingredient
    end
  end

  def add_recipe_card(recipe, date, rating)
    @most_recent = RecipeCard.new(recipe, self, date, rating)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def top_three_recipes
    sorted_recipcards = recipecards.sort_by {|recipecard| recipecard.rating}
    ##reverse order to have highest first
    sorted_recipcards.reverse!
    get_recipes(sorted_recipcards[0..3])
  end

  def most_recent_recipe
    @most_recent.recipe
  end

  def safe_recipes
    Recipe.all.select do |recipe|
      #binding.pry
      recipe_safety = true
      recipe.ingredients.each do |recipe_ingredient|
      #  binding.pry
        if allergic_ingredients.include?(recipe_ingredient)
          recipe_safety = false
          binding.pry
        end
      end
      recipe_safety
    end
  end

end
