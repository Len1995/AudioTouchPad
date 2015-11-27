//
//  ViewController.swift
//  AudioTouchPad
//
//  Created by 20063251 on 20/11/2015.
//  Copyright © 2015 20063251. All rights reserved.
//

import UIKit
import AVFoundation

var loop = false;

class ViewController: UIViewController {
    
    var kickSound : AVAudioPlayer?
    
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
        if let kickSound = self.setupAudioPlayerWithFile("edm-kick-01", type:"wav") {
            self.kickSound = kickSound
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var kickButton: UIButton!
    @IBAction func playKick(sender: AnyObject) {
        if (loop == true){
            kickSound?.prepareToPlay()
            kickSound?.play()
            kickSound?.numberOfLoops = -1
            kickButton.backgroundColor = UIColor.cyanColor()
        }
        else {
            kickSound?.play()
            kickSound?.numberOfLoops = 1
            kickButton.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    @IBOutlet weak var loopButton: UIButton!
    @IBAction func loopSound(sender: AnyObject) {
        if (loop == false) {
            loop = true
            loopButton.backgroundColor = UIColor.greenColor()
        }
        else{
            loop = false
            loopButton.backgroundColor = UIColor.redColor()
        }
    }
}

