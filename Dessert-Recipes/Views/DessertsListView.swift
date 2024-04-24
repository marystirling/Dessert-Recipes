//
//  DessertsListView.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/22/24.
//

import SwiftUI

struct DessertsListView: View {
    
    @StateObject var dessertsVM = DessertsViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(dessertsVM.mealsArrays, id: \.self) { dessert in
                
                NavigationLink{
                    RecipeView(dessert: dessert)
                } label: {
                    Text(dessert.strMeal).font(.title2)
                    
                }.listRowBackground(Color(UIColor(hue: 0.55, saturation: 0.28, brightness: 0.85, alpha: 1.0)))
                
            }
            .listStyle(.sidebar)
            .navigationTitle("All Desserts").monospaced()
            
            
            
            
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
