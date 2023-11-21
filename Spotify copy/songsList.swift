//
//  songsList.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 20/11/23.
//

import Foundation
import SwiftUI

struct songsList: Identifiable {
    var id: UUID = UUID()
    var nameSong: String
    var nameArtist: String
    var imageSong: String = "profile"
    var explicit: Bool 
}
