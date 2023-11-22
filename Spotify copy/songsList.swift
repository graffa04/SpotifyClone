//
//  songsList.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 20/11/23.
//

import Foundation
import SwiftUI

@Observable
class songsList: Identifiable {
    var id: UUID = UUID()
    var nameSong: String
    var nameArtist: String
    var imageSong: String = "profile"
    var explicit: Bool
    var isSelected: Bool
    
    init(id: UUID = UUID(), nameSong: String, nameArtist: String, imageSong: String, explicit: Bool, isSelected: Bool) {
        self.id = id
        self.nameSong = nameSong
        self.nameArtist = nameArtist
        self.imageSong = imageSong
        self.explicit = explicit
        self.isSelected = isSelected
    }
}
