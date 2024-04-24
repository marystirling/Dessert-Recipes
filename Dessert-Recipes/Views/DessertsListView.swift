//
//  DessertsListView.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/22/24.
//

import SwiftUI

struct DessertsListView: View {
    
    //var desserts = ["cookie", "pie", "cake", "brownie"]
    @StateObject var dessertsVM = DessertsViewModel()
    
    var body: some View {
        NavigationStack {
            
            List(dessertsVM.mealsArrays, id: \.self) { dessert in
                
                NavigationLink{
                    RecipeView(dessert: dessert)
                } label: {
                    Text(dessert.strMeal).font(.title2)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Dessert List")
        }
        .task {
            await dessertsVM.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DessertsListView()
    }
}