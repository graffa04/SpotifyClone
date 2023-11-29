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
            .frame(height: 25)
            .clipShape(Rectangle())
            .cornerRadius(30)
            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xSmall/*@END_MENU_TOKEN@*/)
            .font(.system(size: 11))
            
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
    }
}


struct topButtons: View {
    
    @State private var buttonTapped = false

    
    var body: some View {
            HStack {
                Spacer()
                Spacer()
                Button(action: {
                    
                }) {
                    Image("profile")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .shadow(radius: 50)
                }
                ScrollView(.horizontal) {
                    HStack {
                            Button {
                                self.buttonTapped.toggle()
                            } label: {
                                Text("All")
                                    .padding()
                                    .background(buttonTapped ? .green : Color(red: 0.18, green: 0.18, blue: 0.19))
                                    .foregroundColor(buttonTapped ? .black : .white)
                                    .frame(height: 25)
                                    .clipShape(Rectangle())
                                    .cornerRadius(30)
                                    .font(.system(size: 11))
                            }
                            
                            Button {
                                self.buttonTapped.toggle()
                            } label: {
                                Text("Music")
                                    .padding()
                                    .background(buttonTapped ? .green : Color(red: 0.18, green: 0.18, blue: 0.19))
                                    .foregroundColor(buttonTapped ? .black : .white)
                                    .frame(height: 25)
                                    .clipShape(Rectangle())
                                    .cornerRadius(30)
                                    .font(.system(size: 11))
                            }
                            
                            Button {
                                self.buttonTapped.toggle()
                            } label: {
                                Text("Podcast & Shows")
                                    .padding()
                                    .background(buttonTapped ? .green : Color(red: 0.18, green: 0.18, blue: 0.19))
                                    .foregroundColor(buttonTapped ? .black : .white)
                                    .frame(height: 25)
                                    .clipShape(Rectangle())
                                    .cornerRadius(30)
                                    .font(.system(size: 11))
                            }
                            
                            Button {
                                self.buttonTapped.toggle()
                            } label: {
                                Text("AudioBooks")
                                    .padding()
                                    .background(buttonTapped ? .green : Color(red: 0.18, green: 0.18, blue: 0.19))
                                    .foregroundColor(buttonTapped ? .black : .white)
                                    .frame(height: 25)
                                    .clipShape(Rectangle())
                                    .cornerRadius(30)
                                    .font(.system(size: 11))
                            }
                        
                    }
                    
                }
                .scrollIndicators(.hidden)
            }
        
        
    }
}

#Preview {
    topButtons()
}
