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
                    .font(.title)
                    .fontWeight(.bold)
                    .underline()
                
                
                
                if let instructions = recipeVM.recipeArray.first?.strInstructions, !instructions.isEmpty {
                    Text(instructions)
                        .font(.body)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                
                Text("Ingredients")
                    .font(.title)
                    .fontWeight(.bold)
                    .underline()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(1...20, id: \.self) { index in
                            if let ingredient = recipeVM.recipeArray.first?.strIngredient(index), !ingredient.isEmpty,
                               let measure = recipeVM.recipeArray.first?.strMeasure(index), !measure.isEmpty {

                                Text("\(measure) \(ingredient)")
                                    .font(.title2)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .padding(.leading)
                                
                            }
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
