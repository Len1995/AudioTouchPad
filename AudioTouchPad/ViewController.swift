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
    
    var isLoop = false
    func playSound(audio: AVAudioPlayer, button: UIButton, inout isLoop: Bool){
        if (loop == false && isLoop == false){
            audio.prepareToPlay()
            audio.play()
            audio.numberOfLoops = 0
            isLoop = true
            button.backgroundColor = UIColor.darkGrayColor()
        }
        else if (loop == true && isLoop == false){
            audio.prepareToPlay()
            audio.play()
            audio.numberOfLoops = -1
            isLoop = true
            button.backgroundColor = UIColor.cyanColor()
        }
        else {
            audio.stop()
            audio.currentTime = 0
            button.backgroundColor = UIColor.darkGrayColor()
            isLoop = false
        }
    }
    
    
    //Kick 1 Button
    @IBOutlet weak var kickButton1: UIButton!
    var kickButton1Loop = false
    @IBAction func playKick1(sender: AnyObject) {
        playSound(kickSound1!, button: kickButton1, isLoop: &kickButton1Loop)
    }
    
    //Kick 2 Button
    @IBOutlet weak var kickButton2: UIButton!
    var kickButton2Loop = false
    @IBAction func playKick2(sender: AnyObject) {
        playSound(kickSound2!, button: kickButton2, isLoop: &kickButton2Loop)
    }
    
    //Synth Music Button
    @IBOutlet weak var synthButton: UIButton!
    var synthButtonLoop = false
    @IBAction func playSynth(sender: AnyObject) {
        playSound(synthSound!, button: synthButton!, isLoop: &synthButtonLoop)
    }
    
    //Loop button
    @IBOutlet weak var loopButton: UIButton!
    @IBAction func loopToggle(sender: AnyObject) {
        if (loop == false) {
            loop = true
            loopButton.backgroundColor = UIColor.greenColor()
        }
        else{
            loop = false
            loopButton.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBOutlet weak var play1Button: UIButton!
    var play1ButtonLoop = false
    @IBAction func play1Sound(sender: AnyObject) {
        playSound(synthSound!, button: synthButton, isLoop: &synthButtonLoop)
        playSound(kickSound1!, button: kickButton1, isLoop: &kickButton1Loop)
        if (loop == true && play1ButtonLoop == false){
            play1ButtonLoop = true
            play1Button.backgroundColor = UIColor.cyanColor()
        }
        else if (loop == false && kickButton2Loop == false){
            play1ButtonLoop = true
            play1Button.backgroundColor = UIColor.darkGrayColor()
        }
        else {
            play1ButtonLoop = false
            play1Button.backgroundColor = UIColor.darkGrayColor()
        }
    }
}

