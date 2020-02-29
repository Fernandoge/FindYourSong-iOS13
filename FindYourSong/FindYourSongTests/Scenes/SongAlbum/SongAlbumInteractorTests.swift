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
        var presentSomethingCalled = false
        
        func presentSomething(response: SongAlbum.Something.Response)
        {
            presentSomethingCalled = true
        }
    }
    
    // MARK: Tests
    
    func testDoSomething()
    {
        // Given
        let spy = SongAlbumPresentationLogicSpy()
        sut.presenter = spy
        let request = SongAlbum.Something.Request()
        
        // When
        sut.doSomething(request: request)
        
        // Then
        XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
    }
}
