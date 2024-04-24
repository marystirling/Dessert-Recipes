//
//  StartView.swift
//  Dessert-Recipes
//
//  Created by Mary Stirling Brown on 4/24/24.
//

import SwiftUI

struct StartView: View {
    @State private var isDessertsListViewPresented = false

    var body: some View {
        VStack {
            Text("Fetch a Dessert")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)
            
            Button(action: {
                isDessertsListViewPresented = true
            }) {
                Text("Browse Desserts")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isDessertsListViewPresented) {
                DessertsListView()
            }
        }
        .padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
