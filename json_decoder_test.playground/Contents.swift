import UIKit


struct Meal: Codable {
    
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

struct allMeal: Codable {
    var meals: [Meal]
}

let urlString = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!

if let url = URL(string: urlString) {
    if let data = try? Data(contents: url){
        
    }
}

