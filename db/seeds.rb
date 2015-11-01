r1 = Recipe.create(name: "Massa a bolonhesa", description: "E mesmo boa")
r2 = Recipe.create(name: "Bife", description: "Se for de cavalo ainda melhor")

i1 = Ingredient.create(name: "Esparguete")
i2 = Ingredient.create(name: "Tomate")
i3 = Ingredient.create(name: "Cebola")
i4 = Ingredient.create(name: "Azeite")
i5 = Ingredient.create(name: "Carne de vaca")
i6 = Ingredient.create(name: "Alho")
i7 = Ingredient.create(name: "Oregaos")
i8 = Ingredient.create(name: "Pimenta preta")
i9 = Ingredient.create(name: "Piri-piri")

r1.ingredients << [i1,i2,i3,i4,i5,i6,i7,i9]
r2.ingredients << [i5,i8,i6,i4]