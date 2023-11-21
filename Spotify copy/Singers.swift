//
//  Singers.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI

struct buttonSingers: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 126, height: 126)
            .clipShape(Circle())
            .background(
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 126, height: 126)
                    .clipped()
                    .clipShape(Circle())
            )
        Text("Singer")
        .font(
        Font.custom("Inter", size: 12)
        .weight(.medium)
        )
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .frame(width: 37, height: 29,alignment: .leading)
    }
}

struct Singers: View {
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
                .buttonStyle(buttonSingers())
            }
        } .scrollIndicators(.hidden)
    }
}

#Preview {
    Singers()
}
