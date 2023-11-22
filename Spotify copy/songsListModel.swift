//
//  songsListModel.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 20/11/23.
//

import Foundation

class songsListModel {
    var songs: [songsList] = [
        songsList(nameSong: "Mima", nameArtist: "Johns", imageSong: "profile", explicit: false, isSelected: false),
        songsList(nameSong: "John", nameArtist: "Cena", imageSong: "profile", explicit: true, isSelected: false),
        songsList(nameSong: "Francesco", nameArtist: "Dell'Aglio", imageSong: "profile", explicit: true, isSelected: false),
        songsList(nameSong: "Eleonora", nameArtist: "Elefante", imageSong: "profile", explicit: false, isSelected: false),
        songsList(nameSong: "Vasily", nameArtist: "Martin", imageSong: "profile", explicit: true, isSelected: false),
        songsList(nameSong: "Pasquale", nameArtist: "Esposito", imageSong: "profile", explicit: true, isSelected: false),
        songsList(nameSong: "Ciro", nameArtist: "Moccia", imageSong: "profile", explicit: false, isSelected: false),
        songsList(nameSong: "Luca", nameArtist: "Balestrino", imageSong: "profile", explicit: false, isSelected: false),
        songsList(nameSong: "Eleonora", nameArtist: "Elefante", imageSong: "profile", explicit: true, isSelected: false),
    ]
}
