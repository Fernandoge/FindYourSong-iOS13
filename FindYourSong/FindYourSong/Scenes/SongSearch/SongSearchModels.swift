//
//  SongSearchModels.swift
//  FindYourSong
//
//  Created by Fernando Garcia on 27-02-20.
//  Copyright (c) 2020 Fernando Garcia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum SongSearch
{
    // MARK: Use cases
    
    enum FetchSongs
    {
        struct Request
        {
        }
        struct Response {
            var songs: [Song]
        }
        struct ViewModel
        {
            struct FetchedSong: Equatable {
                var name: String
                var artistName: String
                var albumArtworkUrl100: String
                var albumId: Int
            }
            var fetchedSongs: [FetchedSong]
        }
    }
    
    enum SongsPagination
    {
        struct Request
        {
            var fetchedSongs: [SongSearch.FetchSongs.ViewModel.FetchedSong]
            var currentPage: Int
            var songsPerPage: Int
        }
        struct Response
        {
            var filteredSongs: [Song]
            var currentPage: Int
            var leftArrowStatus: Bool
            var rightArrowStatus: Bool
        }
        struct ViewModel
        {
            struct DisplayedSong: Equatable {
                var name: String
                var artistName: String
                var albumArtworkUrl100: String
                var albumId: Int
            }
            var displayedSongs: [DisplayedSong]
            var title: String
            var leftArrowStatus: Bool
            var rightArrowStatus: Bool
        }
    }
}
