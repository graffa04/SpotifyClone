//
//  categoriesModel.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 22/11/23.
//

import Foundation
import SwiftUI

@Observable
class singerList: Identifiable {
    var id: UUID = UUID()
    var nameArtist: String
    var imageSong: String
    
    init(id: UUID = UUID(), nameArtist: String, imageSong: String) {
        self.id = id
        self.nameArtist = nameArtist
        self.imageSong = imageSong

    }
}
