import SwiftUI

struct RecipeView: View {
    
    @StateObject var recipeVM = RecipeViewModel()
    
    var dessert: Dessert
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                Text(dessert.strMeal)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Spacer()
                
                AsyncImage(url: URL(string: dessert.strMealThumb)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 350)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                        
                    }
                }
                Spacer()
                Spacer()
                Spacer()
                Text("Instructions")
                    .font(.title3)
                    .fontWeight(.bold)
                    .underline()
                
                Text(recipeVM.recipeArray.first?.strInstructions ?? "none")
                    .font(.body)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding()
                
                
                Text("Ingredients and Measurements")
                    .font(.title3)
                    .fontWeight(.bold)
                    .underline()
                
                
                
                
                
                ForEach(1...20, id: \.self) { index in
                    if let ingredient = recipeVM.recipeArray.first?.strIngredient(index), !ingredient.isEmpty,
                       let measure = recipeVM.recipeArray.first?.strMeasure(index), !measure.isEmpty {
                        HStack {

                            Text(ingredient)
                                .font(.title2)

                            Text(measure)
                                .font(.title2)

                        }
                    }
                }
            }
            .task {
                recipeVM.idNum = dessert.idMeal
                await recipeVM.getData()
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(dessert: Dessert(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
    }
}
