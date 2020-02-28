//
//  SongSearchWorkerTests.swift
//  FindYourSong
//
//  Created by Fernando Garcia on 27-02-20.
//  Copyright (c) 2020 Fernando Garcia. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import FindYourSong
import XCTest

class SongSearchWorkerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: SongSearchWorker!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupSongSearchWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSongSearchWorker()
    {
        sut = SongSearchWorker()
    }
    
    // MARK: Test doubles
    
    // MARK: Tests
    
    func testSomething()
    {
        // Given
        
        // When
        
        // Then
    }
}