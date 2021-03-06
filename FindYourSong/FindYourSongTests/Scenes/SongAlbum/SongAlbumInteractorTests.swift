//
//  SongAlbumInteractorTests.swift
//  FindYourSong
//
//  Created by Fernando Garcia on 28-02-20.
//  Copyright (c) 2020 Fernando Garcia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import FindYourSong
import XCTest

class SongAlbumInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: SongAlbumInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupSongAlbumInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSongAlbumInteractor()
    {
        sut = SongAlbumInteractor()
    }
    
    // MARK: Test doubles
    
    class SongAlbumPresentationLogicSpy: SongAlbumPresentationLogic
    {
        var presentFetchedAlbumCalled = false
        
        func presentFetchedAlbum(response: SongAlbum.FetchAlbum.Response) {
            presentFetchedAlbumCalled = true
        }
    }
    
    class SongAlbumWorkerSpy: SongAlbumWorker {
        let album = Album(name: "", artistName: "", albumArtworkUrl100: "", songs: [])
        var fetchAlbumCalled = false
        
        override func fetch(albumId: Int) {
            fetchAlbumCalled = true
            delegate?.songAlbumWorker(songAlbumWorker: self, didFetchAlbum: album)
        }
    }
    
    // MARK: Tests
    
    func testFetchAlbumShouldAskWorkerToFetchAlbumWithDelegate() {
        // Given
        let songAlbumWorkerSpy = SongAlbumWorkerSpy()
        sut.worker = songAlbumWorkerSpy
        let request = SongAlbum.FetchAlbum.Request()
        
        // When
        sut.fetchAlbum(request: request)
        
        // Then
        XCTAssert(songAlbumWorkerSpy.fetchAlbumCalled, "fetchAlbum should ask the worker to fetch the album")
        XCTAssertNotNil(sut.worker.delegate, "fetchAlbum should set itself to be delegate to be notified of fetch results")
    }
    
    
    func testSongAlbumWorkerShouldAskPresenterToPresentFetchedAlbum()
    {
        // Given
        let songAlbumWorkerSpy = SongAlbumWorkerSpy()
        sut.worker = songAlbumWorkerSpy
        let songAlbumPresentationLogicSpy = SongAlbumPresentationLogicSpy()
        sut.presenter = songAlbumPresentationLogicSpy
        
        // When
        sut.songAlbumWorker(songAlbumWorker: songAlbumWorkerSpy, didFetchAlbum: songAlbumWorkerSpy.album)
        
        // Then
        XCTAssert(songAlbumPresentationLogicSpy.presentFetchedAlbumCalled, "fetch album should ask the presenter to format the result")
    }
}
