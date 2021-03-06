//
//  ItunesData.swift
//  FindYourSong
//
//  Created by Fernando Garcia on 28-02-20.
//  Copyright © 2020 Fernando Garcia. All rights reserved.
//

import Foundation

struct ItunesData: Decodable {
    var results: [Results]
    
}

struct Results: Decodable {
    let trackCensoredName: String?
    let artistName: String
    let collectionCensoredName: String
    let artworkUrl100: String
    let previewUrl: String?
    let collectionId: Int
}
