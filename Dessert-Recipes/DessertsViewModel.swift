//
//  DessertsViewModel.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/22/24.
//

import Foundation


class DessertsViewModel: ObservableObject {
    
    private struct Meals: Codable {
        let meals: [Dessert]
    }
    
    struct Dessert: Codable, Hashable {
        var idMeal: String
        var strMeal: String
        var strMealThumb: String // do we need to change to URL??
    }
    
    @Published var urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    @Published var mealsArrays: [Dessert] = []
    
    func getData() async {
        print("We are accessing \(urlString)")
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        print("Accessed!")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into our data structures
            guard let mealsList = try? JSONDecoder().decode(Meals.self, from: data) else {
                print("ERROR: Could not decode JSON data")
                return
            }
            print("JSON returned \(mealsList.meals)")
            self.mealsArrays = mealsList.meals
            
            
        } catch {
            print("ERROR: Could not get data from \(urlString)")
        }
        
    }
    
}