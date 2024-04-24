//
//  DessertsViewModel.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/22/24.
//

import Foundation

@MainActor
class DessertsViewModel: ObservableObject {
    
    private struct Meals: Codable {
        let meals: [Dessert]
    }
    
    
    
    @Published var urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    @Published var mealsArrays: [Dessert] = []
    
    func getData() async {
        
        print("Accessing \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        print("Access successful")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into our data structures
            guard let mealsList = try? JSONDecoder().decode(Meals.self, from: data) else {
                print("ERROR: Could not decode JSON data")
                return
            }
            
            print("JSON decoded successfully for dessert list.")
            
            // sort the meals alphabetically, regardless of case
            let sortedMeals = mealsList.meals.sorted { $0.strMeal.caseInsensitiveCompare($1.strMeal) == .orderedAscending}
            self.mealsArrays = sortedMeals
            
            
        } catch {
            print("ERROR: Could not get data from \(urlString)")
        }
        
    }
    
}
