//
//  RecipeViewModel.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/23/24.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    
    private struct Meals: Codable {
        let meals: [Recipe]
    }
    
    
    
    
    var urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    var idNum = ""
    @Published var recipeArray: [Recipe] = []
    
   
    func getData() async {
        
        // adding id to the end of string to access specific recipe
        urlString += idNum
        
        print("We are accessing \(urlString)")
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        print("Accessed!")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into our data structures
            guard let recipeList = try? JSONDecoder().decode(Meals.self, from: data) else {
                print("ERROR: Could not decode JSON data")
                return
            }
            print("JSON returned \(recipeList.meals)")
            
            if let firstRecipe = recipeList.meals.first {
                            self.recipeArray = [firstRecipe] // Assign the first recipe to an array
                        } else {
                            print("No recipes found")
                        }
            print(self.recipeArray)
        } catch {
            print("ERROR: Could not get data from \(urlString)")
        }
        
    }

    
}

extension Recipe {
    func strIngredient(_ index: Int) -> String? {
        switch index {
        case 1: return strIngredient1
        case 2: return strIngredient2
        case 3: return strIngredient3
        case 4: return strIngredient4
        case 5: return strIngredient5
        case 6: return strIngredient6
        case 7: return strIngredient7
        case 8: return strIngredient8
        case 9: return strIngredient9
        case 10: return strIngredient10
        case 11: return strIngredient11
        case 12: return strIngredient12
        case 13: return strIngredient13
        case 14: return strIngredient14
        case 15: return strIngredient15
        case 16: return strIngredient16
        case 17: return strIngredient17
        case 18: return strIngredient18
        case 19: return strIngredient19
        case 20: return strIngredient20
        default: return nil
        }
    }
    
    func strMeasure(_ index: Int) -> String? {
        switch index {
        case 1: return strMeasure1
        case 2: return strMeasure2
        case 3: return strMeasure3
        case 4: return strMeasure4
        case 5: return strMeasure5
        case 6: return strMeasure6
        case 7: return strMeasure7
        case 8: return strMeasure8
        case 9: return strMeasure9
        case 10: return strMeasure10
        case 11: return strMeasure11
        case 12: return strMeasure12
        case 13: return strMeasure13
        case 14: return strMeasure14
        case 15: return strMeasure15
        case 16: return strMeasure16
        case 17: return strMeasure17
        case 18: return strMeasure18
        case 19: return strMeasure19
        case 20: return strMeasure20
        default: return nil
        }
    }
}
