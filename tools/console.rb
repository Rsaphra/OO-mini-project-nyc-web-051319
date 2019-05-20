require_relative '../config/environment.rb'

toenail = Ingredient.new("toenail")
tomato = Ingredient.new("tomato")
sticks = Ingredient.new("stick")
bob = User.new("Bob")
gorbetha = User.new("Gorbetha")
toe_pot_pie = Recipe.new("Toe Pot Pie")
baked_beans = Recipe.new("Baked beans")
bloomin_onyon = Recipe.new("Bloomin Onyun")
baked_bean_ziti = Recipe.new("Baked Bean Ziti")
sticky_rice = Recipe.new("Sticky Rice")
toe_pot_pie.add_ingredients([toenail, tomato])
sticky_rice.add_ingredients([sticks])
baked_bean_ziti.add_ingredients([tomato])

gorbetha.add_recipe_card(toe_pot_pie, "Monday", 11.0/10)
bob.add_recipe_card(baked_beans, "Saturday", 2.0/10)
gorbetha.add_recipe_card(bloomin_onyon, "Monday", 3.0/10)
gorbetha.add_recipe_card(baked_bean_ziti, "Monday", 5.0/10)

bob.declare_allergy(toenail)
gorbetha.declare_allergy(toenail)
gorbetha.declare_allergy(tomato)



binding.pry
