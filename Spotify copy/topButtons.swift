//
//  topButtons.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 14/11/23.
//

import SwiftUI

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0.18, green: 0.18, blue: 0.19))
            .foregroundColor(.white)
            .frame(height: 35)
            .clipShape(Rectangle())
            .cornerRadius(30)
            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xSmall/*@END_MENU_TOKEN@*/)
    }
}

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0.34, green: 0.71, blue: 0.37))
            .foregroundColor(.white)
            .frame(height: 35)
            .clipShape(Rectangle())
            .cornerRadius(30)
            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xSmall/*@END_MENU_TOKEN@*/)
    }
}


struct topButtons: View {
    var body: some View {
            HStack {
                Spacer()
                Spacer()
                Button(action: {
                }) {
                    Image("profile")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(radius: 50)
                }
                ScrollView(.horizontal) {
                    HStack {
                        
                        Group {
                            Button {
                                
                            } label: {
                                Text("All")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Music")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Podcast & Shows")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("AudioBooks")
                            }
                        }
                        .buttonStyle(GrayButton())
                    }
                    
                }
                .scrollIndicators(.hidden)
            }
        
        
    }
}

#Preview {
    topButtons()
}
