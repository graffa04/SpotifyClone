//
//  ContentView.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    topButtons()
                        .padding(.vertical)
                    ScrollView {
                        buttonsTable_()
                            .background(Color(red: 0.07, green: 0.07, blue: 0.07))
                        
                        Text("Your top mixes")
                            .padding()
                            .font(.title)
                            .foregroundColor(Color.white)
                            .position(x: 109,y: 33)
                            .frame(width: 400, height: 50)
                            .bold()
                        
                        
                        slidingCategories()
                        
                        
                        Spacer()
                        Spacer()
                        HStack {
                            Image("profile")
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("More like")
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 13))
                                Text("Kanye West")
                                    .font(.title)
                                    .bold()
                            }
                            
                        } .position(x: 115, y: 25)
                        
                        slidingCategories()
                        
                        Text("Your Favorite artists")
                            .padding()
                            .font(.title)
                            .foregroundColor(Color.white)
                            .position(x: 139,y: 33)
                            .frame(width: 400, height: 50)
                        
                        Singers()
                    }
                    
                    Spacer()
                }
            }
            
            
        }
        tabSong()
        barMenu()
    }
}

#Preview {
    ContentView()
}
