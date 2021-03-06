//
//  _SendSongRouter.swift
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

@objc protocol  SendSongRoutingLogic
{
    func routeToSendSong(segue: UIStoryboardSegue?)
}

protocol  SendSongDataPassing
{
    var dataStore: SendSongDataStore? { get }
}

class SendSongRouter: NSObject, SendSongRoutingLogic, SendSongDataPassing
{
    weak var viewController: SendSongViewController?
    var dataStore: SendSongDataStore?
    
    //MARK: Routing
    
    func routeToSendSong(segue: UIStoryboardSegue?)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "SongSearchViewController") as! SongSearchViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSendSong(source: dataStore!, destination: &destinationDS)
        navigateToSendSong(source: viewController!, destination: destinationVC)
        
    }
    
    //MARK: Navigation
    
    func navigateToSendSong(source: SendSongViewController, destination: SongSearchViewController)
    {
        source.show(destination, sender: nil)
    }
    
    //MARK: Passing data
    
    func passDataToSendSong(source:  SendSongDataStore, destination: inout SongSearchDataStore)
    {
        destination.songName = source.songName
    }
}
