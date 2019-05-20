class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
     @@all << self
  end

  def self.all
    @@all
  end

  def allergies
    Allergy.all.select do |allergy|
      allergy.ingredient == self
    end
  end

  def users
    allergies.map do |allergy|
      allergy.user
    end
  end

  def self.most_common_allergen
    max_length = 0
    max_ingredient = nil
    @@all.each do |ingredient|
      if ingredient.users.length > max_length
        max_length = ingredient.users.length
        max_ingredient = ingredient
        binding.pry
      end
    end
    max_ingredient
  end

end
