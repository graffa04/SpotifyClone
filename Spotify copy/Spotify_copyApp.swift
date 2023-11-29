//
//  Spotify_copyApp.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 14/11/23.
//

import SwiftUI
import SwiftData


@main
struct Spotify_copyApp: App {
    @State private var isDarkMode = true
    //    @StateObject var currentSong: songsList = songsList(nameSong: "John", nameArtist: "Cena", imageSong: "profile", explicit: true)
        
        var body: some Scene {
            WindowGroup {
                barMenu()
                    .preferredColorScheme(isDarkMode ? .dark : .dark)
    //                .environmentObject(currentSong)
            }/*.modelContainer(for: songsList.self)*/
            
    }
}
