//
//  slidingCategories.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI

struct Categories: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 150)
            .clipShape(Rectangle())
            .background(
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
            )
        Text("Arianna Grande, The Weeknd, Luchè, Geolier")
        .font(
        Font.custom("Inter", size: 10)
        .weight(.medium)
        )
        .foregroundColor(.gray)
        .frame(width: 150, height: 29,alignment: .leading)
    }
}



struct slidingCategories: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Spacer()
                Spacer()
                Group {
                    Button("") {
                        
                    }
                    Button("") {
                        
                    }
                    Button("") {
                        
                    }
                    Button("") {
                        
                    }
                    Button("") {
                        
                    }
                }
                .buttonStyle(Categories())
                
            }
            
        } .scrollIndicators(.hidden)
    }
}

#Preview {
    slidingCategories()
}
