//
//  ViewController.swift
//  AudioTouchPad
//
//  Created by 20063251 on 20/11/2015.
//  Copyright © 2015 20063251. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var kickButton : AVAudioPlayer?
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
    override func viewDidLoad() {
        if let kickButton = self.setupAudioPlayerWithFile("kick", type:"wav") {
            self.kickButton = kickButton
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playKick(sender: AnyObject) {
        kickButton?.prepareToPlay()
        kickButton?.play()
        kickButton?.numberOfLoops = -1
    }
}

