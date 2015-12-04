//
//  ViewController.swift
//  AudioTouchPad
//
//  Created by 20063251 on 20/11/2015.
//  Copyright © 2015 20063251. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var loop = false;
    var bassDrop : AVAudioPlayer?
    var dropThisBeast : AVAudioPlayer?
    var dubstep1 : AVAudioPlayer?
    var dubstep2 : AVAudioPlayer?
    var dubstep3 : AVAudioPlayer?
    var dubstep4 : AVAudioPlayer?
    var dubstep5 : AVAudioPlayer?
    var dubstep6 : AVAudioPlayer?
    var dubstep7 : AVAudioPlayer?
    var dubstep8 : AVAudioPlayer?
    var dubstep9 : AVAudioPlayer?
    var glitchyVoice : AVAudioPlayer?
    var growlChop : AVAudioPlayer?
    var guitarSlayer : AVAudioPlayer?
    var heavyDrop : AVAudioPlayer?
    var myishish : AVAudioPlayer?
    var robotFace : AVAudioPlayer?
    var robotGlitch : AVAudioPlayer?
    var robotLoop : AVAudioPlayer?
    var robotNormal : AVAudioPlayer?
    var scratcher : AVAudioPlayer?
    var silverRobot : AVAudioPlayer?
    var snapfui : AVAudioPlayer?
    var superRobot : AVAudioPlayer?
    var three : AVAudioPlayer?
    
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
        
        if let bassDrop = self.setupAudioPlayerWithFile("bassdrop", type:"wav") {
            self.bassDrop = bassDrop
        }
        if let dropThisBeast = self.setupAudioPlayerWithFile("dropthisbeast", type:"wav") {
            self.dropThisBeast = dropThisBeast
        }
        if let dubstep1 = self.setupAudioPlayerWithFile("dubstep1", type:"wav") {
            self.dubstep1 = dubstep1
        }
        if let dubstep2 = self.setupAudioPlayerWithFile("dubstep2", type:"wav") {
            self.dubstep2 = dubstep2
        }
        if let dubstep3 = self.setupAudioPlayerWithFile("dubstep3", type:"wav") {
            self.dubstep3 = dubstep3
        }
        if let dubstep4 = self.setupAudioPlayerWithFile("dubstep4", type:"wav") {
            self.dubstep4 = dubstep4
        }
        if let dubstep5 = self.setupAudioPlayerWithFile("dubstep5", type:"wav") {
            self.dubstep5 = dubstep5
        }
        if let dubstep6 = self.setupAudioPlayerWithFile("dubstep6", type:"wav") {
            self.dubstep6 = dubstep6
        }
        if let dubstep7 = self.setupAudioPlayerWithFile("dubstep7", type:"wav") {
            self.dubstep7 = dubstep7
        }
        if let dubstep8 = self.setupAudioPlayerWithFile("dubstep8", type:"wav") {
            self.dubstep8 = dubstep8
        }
        if let dubstep9 = self.setupAudioPlayerWithFile("dubstep9", type:"wav") {
            self.dubstep9 = dubstep9
        }
        if let glitchyVoice = self.setupAudioPlayerWithFile("glitchyvoice", type:"wav") {
            self.glitchyVoice = glitchyVoice
        }
        if let growlChop = self.setupAudioPlayerWithFile("growlchop", type:"wav") {
            self.growlChop = growlChop
        }
        if let guitarSlayer = self.setupAudioPlayerWithFile("guitarslayer", type:"wav") {
            self.guitarSlayer = guitarSlayer
        }
        if let heavyDrop = self.setupAudioPlayerWithFile("heavydrop", type:"wav") {
            self.heavyDrop = heavyDrop
        }
        if let myishish = self.setupAudioPlayerWithFile("myishish", type:"wav") {
            self.myishish = myishish
        }
        if let robotFace = self.setupAudioPlayerWithFile("robotface", type:"wav") {
            self.robotFace = robotFace
        }
        if let robotGlitch = self.setupAudioPlayerWithFile("robotglitch", type:"wav") {
            self.robotGlitch = robotGlitch
        }
        if let robotLoop = self.setupAudioPlayerWithFile("robotloop", type:"wav") {
            self.robotLoop = robotLoop
        }
        if let robotNormal = self.setupAudioPlayerWithFile("robotnormal", type:"wav") {
            self.robotNormal = robotNormal
        }
        if let scratcher = self.setupAudioPlayerWithFile("scratcher", type:"wav") {
            self.scratcher = scratcher
        }
        if let silverRobot = self.setupAudioPlayerWithFile("silverrobot", type:"wav") {
            self.silverRobot = silverRobot
        }
        if let snapfui = self.setupAudioPlayerWithFile("snapfui", type:"wav") {
            self.snapfui = snapfui
        }
        if let superRobot = self.setupAudioPlayerWithFile("superrobot", type:"wav") {
            self.superRobot = superRobot
        }
        if let three = self.setupAudioPlayerWithFile("three", type:"wav") {
            self.three = three
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
            button.backgroundColor = UIColor.blueColor()
        }
        else {
            audio.stop()
            audio.currentTime = 0
            button.backgroundColor = UIColor.darkGrayColor()
            isLoop = false
        }
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
    
    @IBOutlet weak var dubstep1Button: UIButton!
    var dubstep1Loop = false
    @IBAction func playDubstep1(sender: AnyObject) {
        playSound(dubstep1!, button: dubstep1Button, isLoop: &dubstep1Loop)
    }
    
    @IBOutlet weak var dubstep2Button: UIButton!
    var dubstep2Loop = false
    @IBAction func playDubstep2(sender: AnyObject) {
        playSound(dubstep2!, button: dubstep2Button, isLoop: &dubstep2Loop)
    }
    
    @IBOutlet weak var dubstep3Button: UIButton!
    var dubstep3Loop = false
    @IBAction func playDubstep3(sender: AnyObject) {
        playSound(dubstep3!, button: dubstep3Button, isLoop: &dubstep3Loop)
    }
    
    @IBOutlet weak var dubstep4Button: UIButton!
    var dubstep4Loop = false
    @IBAction func playDubstep4(sender: AnyObject) {
        playSound(dubstep4!, button: dubstep4Button, isLoop: &dubstep4Loop)
    }
    
    @IBOutlet weak var dubstep5Button: UIButton!
    var dubstep5Loop = false
    @IBAction func playDubstep5(sender: AnyObject) {
        playSound(dubstep5!, button: dubstep5Button, isLoop: &dubstep5Loop)
    }
    
    @IBOutlet weak var dubstep6Button: UIButton!
    var dubstep6Loop = false
    @IBAction func playDubstep6(sender: AnyObject) {
        playSound(dubstep6!, button: dubstep6Button, isLoop: &dubstep6Loop)
    }
    
    @IBOutlet weak var dubstep7Button: UIButton!
    var dubstep7Loop = false
    @IBAction func playDubstep7(sender: AnyObject) {
        playSound(dubstep7!, button: dubstep7Button, isLoop: &dubstep7Loop)
    }
    
    @IBOutlet weak var dubstep8Button: UIButton!
    var dubstep8Loop = false
    @IBAction func playDubstep8(sender: AnyObject) {
        playSound(dubstep8!, button: dubstep8Button, isLoop: &dubstep8Loop)
    }
    
    @IBOutlet weak var dubstep9Button: UIButton!
    var dubstep9Loop = false
    @IBAction func playDubstep9(sender: AnyObject) {
        playSound(dubstep9!, button: dubstep9Button, isLoop: &dubstep9Loop)
    }
}

