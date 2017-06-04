//
//  VideoViewController.swift
//  Doctodoor
//
//  Created by Hardik on 22/08/15.
//  Copyright (c) 2015 PRAXINFO. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
import AVFoundation
//import Cordova

@objc(HKVideoPlayer) class HKVideoPlayer: CDVPlugin {
    var playerViewController:AVPlayerViewController!
    override func pluginInitialize() {
        playerViewController = AVPlayerViewController()
        
    }
    
    @objc(play:)
    func play(command:CDVInvokedUrlCommand){
        guard let url = command.argument(at: 0) as? String else {
            return
        }
       
        
        let videoURL = URL(string: url)
        let player = AVPlayer(url: videoURL!)
        self.present(player: player)
        
    }
    @objc(playLocal:)
    func playLocal(command:CDVInvokedUrlCommand){
        guard let name = command.argument(at: 0) as? String else {
            return
        }
        let ext = name.fileExtension()
        let file = name.fileName()
        let path = Bundle.main.path(forResource: file, ofType: ext, inDirectory: "www/assets/video")
        let videoURL = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: videoURL)
        self.present(player: player)
        
    }

    private func present(player:AVPlayer){
        
        playerViewController.player = player
        
        DispatchQueue.main.async {
            self.viewController.present(self.playerViewController, animated: true) {
                self.playerViewController.player!.play()
            }
            
        }
        
    }
    
    deinit {
        self.playerViewController = nil
    }
    
    
    
}
extension String {
    
    func fileName() -> String {
        
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent {
            return fileNameWithoutExtension
        } else {
            return ""
        }
    }
    
    func fileExtension() -> String {
        
        if let fileExtension = NSURL(fileURLWithPath: self).pathExtension {
            return fileExtension
        } else {
            return ""
        }
    }
}
