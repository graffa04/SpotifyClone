//
//  barMenu.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 15/11/23.
//

import SwiftUI



struct barMenu: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var isDarkMode = true
    @State private var selectedTab: Int = 0
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ContentView()
                    .tabItem {
                        Label("House", systemImage: "house")
                    }.tag(0)
                
                searchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }.tag(1)
                
                buttonsTable_()
                    .tabItem {
                        Label("Your library", systemImage: "books.vertical")
                        
                    }.tag(2)
            }
            .preferredColorScheme(isDarkMode ? .dark : .dark)
            .tint(Color(.white))
            tabSong()
                .padding(.top, 575.0)
                
        }
    }
    
        
}

#Preview {
    barMenu()
}
