class Ingredient
    attr_reader :name,
                 :unit_of_measure,
                 :calories

  def initialize(name, unit_of_measure, calories)
    @name = name
    @unit_of_measure = unit_of_measure
    @calories = calories
  end

end
