class Recipe
  attr_reader :name,
              :ingredients,
              :total_calories

  def initialize(name)
    @name = name
    @ingredients = {}
    @total_calories = 0
  end

  def add_ingredient(ingredient, amount)
    @ingredients[ingredient.name] = "#{amount} #{ingredient.unit}"
    @total_calories += (ingredient.calories * amount)
  end
  def amount_needed(ingredient)
    ingredient.downcase!
    if @ingredients.include?(ingredient)
      @ingredients[ingredient]
    else
      "This recipe doesn't need any #{ingredient}."
    end
  end



end
