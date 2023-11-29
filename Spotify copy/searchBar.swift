//
//  searchBar.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 27/11/23.
//

import SwiftUI

struct searchBar: View {
    var songList = songsListModel()
    
    @State private var song: [songsList] = []
    @State private var searchTerm = ""
    
    var filteredSong: [songsList] {
        if searchTerm == "" {
            return song
        } else {
            return song.filter { song in
                return song.nameSong.lowercased().contains(searchTerm.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ForEach(songList.songs) { songList in
                Button {
                } label: {
                    HStack {
                        Image(songList.imageSong)
                            .resizable()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(songList.nameSong)
                                .font(.system(size: 14))
                                .foregroundColor(songList.isSelected ? .green : .white)
                            
                            HStack{
                                
                                Text(songList.nameArtist)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                            .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                }
            }.frame(width: 350, height: 60)
        }.searchable(text: $searchTerm, prompt: "What do you want to listen to?")
    }
}

#Preview {
    searchBar()
}
