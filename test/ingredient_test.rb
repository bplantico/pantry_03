require 'minitest/autorun'
require 'minitest/emoji'
require './lib/ingredient'

class IngredientTest < Minitest::Test

  def setup
    @sugar = Ingredient.new("sugar", "C", 773)
  end

  def test_it_exists
    assert_instance_of Ingredient, @sugar
  end

  def test_it_has_attributes
    assert_equal "sugar", @sugar.name
    assert_equal "C", @sugar.unit
    assert_equal 773, @sugar.calories
  end

end

# build an Ingredient class with the following attributes:
#
# name - the name of the ingredient
# unit - the unit in which the ingredient is measured
# calories - the amount of calories per unit of the ingredient.
