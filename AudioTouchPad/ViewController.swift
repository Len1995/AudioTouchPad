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
    
    var kickSound1 : AVAudioPlayer?
    var kickSound2 : AVAudioPlayer?
    var synthSound : AVAudioPlayer?
    
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
        if let kickSound1 = self.setupAudioPlayerWithFile("edm-kick-01", type:"wav") {
            self.kickSound1 = kickSound1
        }
        if let kickSound2 = self.setupAudioPlayerWithFile("edm-kick-02", type:"wav") {
            self.kickSound2 = kickSound2
        }
        if let synthSound = self.setupAudioPlayerWithFile("sky-synth", type:"wav") {
            self.synthSound = synthSound
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Kick 1 Button
    @IBOutlet weak var kickButton1: UIButton!
    var kickButton1Loop = false
    @IBAction func playKick1(sender: AnyObject) {
        if (loop == true && kickButton1Loop == false){
            kickSound1?.prepareToPlay()
            kickSound1?.play()
            kickSound1?.numberOfLoops = -1
            kickButton1.backgroundColor = UIColor.cyanColor()
            kickButton1Loop = true
        }
        else if (loop == false && kickButton1Loop == false){
            kickSound1?.play()
            kickSound1?.numberOfLoops = 0
            kickButton1.backgroundColor = UIColor.darkGrayColor()
            kickButton1Loop = true
        }
        else{
            kickSound1?.stop()
            kickSound1?.currentTime = 0
            kickButton1.backgroundColor = UIColor.darkGrayColor()
            kickButton1Loop = false
        }
    }
    
    //Kick 2 Button
    @IBOutlet weak var kickButton2: UIButton!
    var kickButton2Loop = false
    @IBAction func playKick2(sender: AnyObject) {
        if (loop == true && kickButton2Loop == false){
            kickSound2?.prepareToPlay()
            kickSound2?.play()
            kickSound2?.numberOfLoops = -1
            kickButton2.backgroundColor = UIColor.cyanColor()
            kickButton2Loop = true
        }
        else if (loop == false && kickButton2Loop == false){
            kickSound2?.play()
            kickSound2?.numberOfLoops = 0
            kickButton2.backgroundColor = UIColor.darkGrayColor()
            kickButton2Loop = true
        }
        else {
            kickSound2?.stop()
            kickSound2?.currentTime = 0
            kickButton2.backgroundColor = UIColor.darkGrayColor()
            kickButton2Loop = false
        }
    }
    
    //Synth Music Button
    @IBOutlet weak var synthButton: UIButton!
    var synthButtonLoop = false
    @IBAction func playSynth(sender: AnyObject) {
        if (loop == true && synthButtonLoop == false){
            synthSound?.prepareToPlay()
            synthSound?.play()
            synthSound?.numberOfLoops = -1
            synthButton.backgroundColor = UIColor.cyanColor()
            synthButtonLoop = true
        }
        else if (loop == false && synthButtonLoop == false){
            synthSound?.play()
            synthSound?.numberOfLoops = 0
            synthButton.backgroundColor = UIColor.darkGrayColor()
            synthButtonLoop = true
        }
        else{
            synthSound?.stop()
            synthSound?.currentTime = 0
            synthButton.backgroundColor = UIColor.darkGrayColor()
            synthButtonLoop = false
        }
    }
    
    //Loop button
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

