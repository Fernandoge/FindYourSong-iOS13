//
//  SongAlbumPresenterTests.swift
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

class SongAlbumPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: SongAlbumPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupSongAlbumPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSongAlbumPresenter()
    {
        sut = SongAlbumPresenter()
    }
    
    // MARK: Test doubles
    
    class SongAlbumDisplayLogicSpy: SongAlbumDisplayLogic
    {
        var displayFetchedAlbumCalled = false
        
        func displayFetchedAlbum(viewModel: SongAlbum.FetchAlbum.ViewModel) {
            displayFetchedAlbumCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPresentFetchedAlbum()
    {
        // Given
        let songAlbumDisplayLogic = SongAlbumDisplayLogicSpy()
        sut.viewController = songAlbumDisplayLogic
        let response = SongAlbum.FetchAlbum.Response(album: Album(name: "", artistName: "", albumArtworkUrl100: "", songs: []))
        
        // When
        sut.presentFetchedAlbum(response: response)
        
        // Then
        XCTAssertTrue(songAlbumDisplayLogic.displayFetchedAlbumCalled, "presentFetchedAlbum should ask the view controller to display the result")
    }
}
