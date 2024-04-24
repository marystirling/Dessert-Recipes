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
        ZStack {
            Color(UIColor(hue: 0.55, saturation: 0.28, brightness: 0.85, alpha: 1.0)) // Pale blue color
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Fetch a Dessert")
                    .font(.system(size: 60)) // Change "YourCustomFont" to the name of the font you want to use
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                    .monospaced()
                    .lineLimit(3)
                
                
                Image("cupcake")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
                Spacer()
                
                
                Button(action: {
                    isDessertsListViewPresented = true
                }) {
                    Text("Browse Desserts")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .monospaced()
                        .foregroundColor(.white)
                        .background(Color(UIColor(hue: 0.9, saturation: 0.24, brightness: 0.8, alpha: 1.0) ))
                        .cornerRadius(20)
                }
                .sheet(isPresented: $isDessertsListViewPresented) {
                    DessertsListView()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
