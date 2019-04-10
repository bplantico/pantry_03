require 'minitest/autorun'
require 'minitest/emoji'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @simple_syrup = Recipe.new("simple syrup")
    @sugar = Ingredient.new("sugar", "C", 773)
    @water = Ingredient.new("water", "oz", 0)

    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @macaroni = Ingredient.new("Macaroni", "oz", 220)
    @cheese = Ingredient.new("Cheese", "C", 220)

  end

  def test_it_exists
    assert_instance_of Recipe, @simple_syrup
  end

  def test_it_exists_again
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_it_has_a_name
    assert_equal "Mac and Cheese", @mac_and_cheese.name
  end

  def test_ingredients_initializes_empty
    assert_equal ({}), @mac_and_cheese.ingredients
  end

  def test_add_ingredient_method
    @simple_syrup.add_ingredient(@sugar, 2)
    expected_1 = {
                "sugar" => "2 C"
                }
    assert_equal expected_1, @simple_syrup.ingredients

    @simple_syrup.add_ingredient(@water, 8)

    expected_2 = {
                "sugar" => "2 C",
                "water" => "8 oz"
                }

    assert_equal expected_2, @simple_syrup.ingredients
  end

  def test_amount_needed_can_be_returned
    @simple_syrup.add_ingredient(@sugar, 2)
    @simple_syrup.add_ingredient(@water, 8)

    assert_equal "2 C",  @simple_syrup.amount_needed("Sugar")
    assert_equal "8 oz", @simple_syrup.amount_needed('water')
    assert_equal "This recipe doesn't need any chocolate.", @simple_syrup.amount_needed('chocolate')
  end

  def test_total_calories_method
    @simple_syrup.add_ingredient(@water, 8)
    assert_equal 0, @simple_syrup.total_calories

    @simple_syrup.add_ingredient(@sugar, 2)
    assert_equal 1546, @simple_syrup.total_calories

    @simple_syrup.add_ingredient(@cheese, 1)
    assert_equal 1766, @simple_syrup.total_calories
  end

end
