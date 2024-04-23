//
//  RecipeView.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/22/24.
//

import SwiftUI


struct RecipeView: View {
    
    @StateObject var recipeVM = RecipeViewModel()
    
    var dessert: Dessert
    
    var body: some View {
        VStack(alignment: .center){
            Text(dessert.strMeal)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
            Spacer()
            
            Image(systemName: "figure.run")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all)
                
            Spacer()
            Text(recipeVM.recipeArray.first?.strInstructions ?? "none").font(.largeTitle).bold()
            
        }.task {
            recipeVM.idNum = dessert.idMeal
            await recipeVM.getData()
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(dessert: Dessert(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
    }
}
