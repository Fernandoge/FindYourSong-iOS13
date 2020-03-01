//
//  SongSearchInteractor.swift
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

protocol SongSearchBusinessLogic
{
    func fetchSongs(request: SongSearch.FetchSongs.Request)
    func filterSongs(request: SongSearch.SongsPagination.Request)
}

protocol SongSearchDataStore
{
    var songName: String { get set }
    var selectableSongs: [Song]? { get }
}

class SongSearchInteractor: SongSearchBusinessLogic, SongSearchDataStore, SongSearchWorkerDelegate
{
    
    var presenter: SongSearchPresentationLogic?
    var worker = SongSearchWorker()
    var songName: String = ""
    var selectableSongs: [Song]?
    
    // MARK: Fetch songs
    
    func fetchSongs(request: SongSearch.FetchSongs.Request)
    {
        worker.delegate = self
        worker.fetch(songName: songName)
    }
    
    func songSearchWorker(songSearchWorker: SongSearchWorker, didFetchSongs songs: [Song]) {
        let response = SongSearch.FetchSongs.Response(songs:songs)
        presenter?.presentFetchedSongs(response: response)
    }
    
}
