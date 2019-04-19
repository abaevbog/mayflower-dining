class PrepController < ApplicationController
  def preppage
     date = Date.new.strftime("%d/%m/%Y")
     if Menu.get_ingredients_by_date(date) != []
       @ingriedent_array = Menu.get_ingredients_by_date(date)
       puts @ingriedent_array
     else 
      @ingriedent_array = [[name: "food", portion_size: "number", done: false, id: 0]]
    end
  end
  def checked
      id = params [:id]
      ingredient =get_indredient_by_id(id)
      ingredient.done=true
  end 
end
