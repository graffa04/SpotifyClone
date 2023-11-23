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
    var body: some View {
        TabView {
            buttonsTable_()
                .tabItem {
                    Label("House", systemImage: "house")
                }
            
            buttonsTable_()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            buttonsTable_()
                .tabItem {
                    Label("Your library", systemImage: "books.vertical")
                    
                }
        }
        .preferredColorScheme(isDarkMode ? .dark : .dark)
        .tint(Color(.white))
        .frame(height: 40)
    }
    
        
}

#Preview {
    barMenu()
}
