r1 = Recipe.create!(user_id: 1, name: "Massa a bolonhesa", description: "E mesmo boa", image: "http://definicaototal.com.br/wp-content/uploads/2014/06/Bolonhesa_Macarr%C3%A3oEnergia.jpg", time: 20)
r2 = Recipe.create!(user_id: 1, name: "Bife", description: "Se for de cavalo ainda melhor", image: "http://www.gastrobahia.com.br/wp-content/uploads/2015/01/bife.jpg",time: 9)

i1 = Ingredient.create!(name: "Esparguete", calories: 100)
i2 = Ingredient.create!(name: "Tomate", calories: 100)
i3 = Ingredient.create!(name: "Cebola", calories: 100)
i4 = Ingredient.create!(name: "Azeite", calories: 100)
i5 = Ingredient.create!(name: "Carne de vaca", calories: 100)
i6 = Ingredient.create!(name: "Alho", calories: 100)
i7 = Ingredient.create!(name: "Oregaos", calories: 100)
i8 = Ingredient.create!(name: "Pimenta preta", calories: 100)
i9 = Ingredient.create!(name: "Piri-piri", calories: 100)

r1.ingredients << [i1,i2,i3,i4,i5,i6,i7,i9]
r2.ingredients << [i5,i8,i6,i4]


s2 = Step.create!(stepnumber: 2, name: "Ferver agua",
                 description: "Encha uma panela com agua e ponha no lume ate ferver")
s1 = Step.create!(stepnumber: 1, name: "Fazer estrugido",
                 description: "Pique a cebola. Deite um fio pequeno de azeite na panela ate cubrir o fundo e junte a cebola. Aqueca em lume brando ate a cebola ficar dourada")
s3 = Step.create!(stepnumber: 3, name: "Comer",
                 description: "Coma ate nao conseguir mais")
s4 = Step.create!(stepnumber: 1, name: "Aquecer azeite",
                 description: "Azeite pa panela, aquecer ate ficar quente (nao exprimente por la a mao para saber se esta quente)")
s5 = Step.create!(stepnumber: 2, name: "Por o bife",
                 description: "Bife pa panela")

r1.steps << [s2,s1,s3]
r2.steps << [s4,s5]

Category.create!(name: "Almoco")
Category.create!(name: "Pequeno-Almoco")
Category.create!(name: "Jantar")
Category.create!(name: "Lanche")
