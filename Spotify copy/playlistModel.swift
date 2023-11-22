//
//  playlistModel.swift
//  Spotify copy
//
//  Created by Raffaele Marino  on 16/11/23.
//

import Foundation
import SwiftUI

struct playlistModel: Identifiable {
    var id: UUID = UUID()
    var Image: String = "playlist1"
    var nameProfile: String = "Name playlist"
    var imageProfile: String = "profile"
    var details: String = "Album · 4h 23m"
}

