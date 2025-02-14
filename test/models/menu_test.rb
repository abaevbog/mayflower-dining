require 'test_helper'
require "time"

class MenuTest < ActiveSupport::TestCase
    # basic crud model tests
    
    #for later refactoring
    # def setup
    #   menu = Menu.new(day = 1, type_of_meal= 'Entree')
    # end
    
    test 'add day in cycle' do
        menu = Menu.new(day: 1, dish_id: 1, type_of_meal: 'Entree')
        assert menu.valid?
    end
    
    test 'add day in cycle (no  dish)' do
        menu = Menu.new(day: 1, type_of_meal: 'Entree')
        assert menu.valid?
    end
    
    test 'add day in cycle (no  dish, no type_of_meal)' do
        menu = Menu.new(day: 1)
        assert menu.valid?
    end
    
    test 'add day in cycle (no day, no type_of_meal)' do
        menu = Menu.new(type_of_meal: 'Entree')
        refute menu.valid?
    end
    
    test 'get day in cycle' do
        menu = Menu.new(day: 1, type_of_meal: 'Entree')
        assert_equal(1, menu.day) 
    end
    
    test 'update day in cycle' do
        menu = Menu.new(day: 2, type_of_meal: 'Salad')
        menu.type_of_meal = 'Entree'
        assert_equal('Entree',menu.type_of_meal)
    end
  
    test 'delete day in cycle' do
        menu2 = Menu.create(day: 27, type_of_meal: 'Dinner')
        len = Menu.all.length
        menu2.destroy
        assert_equal((len - 1) , Menu.all.length)
    end
    
    #add_to_cycle(day_in_cycle, dish_id,dish_type)
    test 'add_dishes_to_cycle (One dish)' do
        dish = Dish.create
        menu = Menu.add_dishes_to_cycle(1,  [dish])
        assert menu.valid?
        assert_equal(1,menu.day)
        # assert_equal('Entree',menu.type_of_meal)
    end
    
    test 'add_dishes_to_cycle(five dishes)' do
        dish = Dish.create
        dish2 = Dish.create
        dish3 = Dish.create
        dish4 = Dish.create
        dish5 = Dish.create
        menu = Menu.add_dishes_to_cycle(19,  [dish,dish2,dish3,dish4,dish5])
        assert menu.valid?
        assert_equal(19,menu.day)
        assert_equal(5,menu.dishes.length)
        # assert_equal('Entree',menu.type_of_meal)
    end
    

    
end