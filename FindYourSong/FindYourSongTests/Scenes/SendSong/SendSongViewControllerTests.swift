//
//  SendSongViewControllerTests.swift
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

class SendSongViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: SendSongViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupSendSongViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupSendSongViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "SendSongViewController") as? SendSongViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class SendSongBusinessLogicSpy: SendSongBusinessLogic
    {
        var doSomethingCalled = false
        
        func doSomething(request: SendSong.SendSong.Request)
        {
            doSomethingCalled = true
        }
        
        var sendSongCalled = false
        
        func sendSong(request: SendSong.SendSong.Request) {
            sendSongCalled = true
        }
    }
    
    // MARK: Tests
    
    func testSearchButtonShouldCallSendSongMethod() {
        //Given
        loadView()
        let sendSongBusinessLogicSpy = SendSongBusinessLogicSpy()
        sut.interactor = sendSongBusinessLogicSpy
        
        // When
        sut.searchTextField.becomeFirstResponder()
        sut.searchTextField.text = "SongName"
        sut.searchPressed(self)
        
        //Then
        XCTAssert(sendSongBusinessLogicSpy.sendSongCalled, "Pressing the search button should call SendSong method")
    }
    
    func testTappingReturnKeyShouldCallSendSongMethod() {
        //Given
        loadView()
        let sendSongBusinessLogicSpy = SendSongBusinessLogicSpy()
        sut.interactor = sendSongBusinessLogicSpy
        
        // When
        sut.searchTextField.becomeFirstResponder()
        sut.searchTextField.text = "SongName"
        _ = sut.textFieldShouldReturn(sut.searchTextField)
        
        //Then
        XCTAssert(sendSongBusinessLogicSpy.sendSongCalled, "Tapping the return key should call SearchSong method")
    }
}
