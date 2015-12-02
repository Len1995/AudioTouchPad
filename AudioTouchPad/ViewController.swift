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
    var dubstep01 : AVAudioPlayer?
    var dubstep03 : AVAudioPlayer?
    var dubstep04 : AVAudioPlayer?
    var dubstep05 : AVAudioPlayer?
    var dubstep07 : AVAudioPlayer?
    var dubstep08 : AVAudioPlayer?
    var dubstep10 : AVAudioPlayer?
    var dubstep11 : AVAudioPlayer?
    var dubstep12 : AVAudioPlayer?
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
        if let dubstep01 = self.setupAudioPlayerWithFile("dubstep01", type:"wav") {
            self.dubstep01 = dubstep01
        }
        if let dubstep03 = self.setupAudioPlayerWithFile("dubstep03", type:"wav") {
            self.dubstep03 = dubstep03
        }
        if let dubstep04 = self.setupAudioPlayerWithFile("dubstep04", type:"wav") {
            self.dubstep04 = dubstep04
        }
        if let dubstep05 = self.setupAudioPlayerWithFile("dubstep05", type:"wav") {
            self.dubstep05 = dubstep05
        }
        if let dubstep07 = self.setupAudioPlayerWithFile("dubstep07", type:"wav") {
            self.dubstep07 = dubstep07
        }
        if let dubstep08 = self.setupAudioPlayerWithFile("dubstep08", type:"wav") {
            self.dubstep08 = dubstep08
        }
        if let dubstep10 = self.setupAudioPlayerWithFile("dubstep10", type:"wav") {
            self.dubstep10 = dubstep10
        }
        if let dubstep11 = self.setupAudioPlayerWithFile("dubstep11", type:"wav") {
            self.dubstep11 = dubstep11
        }
        if let dubstep12 = self.setupAudioPlayerWithFile("dubstep12", type:"wav") {
            self.dubstep12 = dubstep12
        }//comment
        if let glitchyVoice = self.setupAudioPlayerWithFile("glitchyvoice", type:"wav") {
            self.glitchyVoice = glitchyVoice
        }
        if let growlChop = self.setupAudioPlayerWithFile("growlchop", type:"wav") {
            self.growlChop = growlChop
        }
        if let guitarSlayer = self.setupAudioPlayerWithFile("guitarslayer", type:"wav") {
            self.guitarSlayer = guitarSlayer
        }
        if let heavyDrop = self.setupAudioPlayerWithFile("heavyDrop", type:"wav") {
            self.heavyDrop = heavyDrop
        }
        if let myishish = self.setupAudioPlayerWithFile("myishish", type:"wav") {
            self.myishish = myishish
        }
        if let robotFace = self.setupAudioPlayerWithFile("robotface", type:"wav") {
            self.robotFace = robotFace
        }
        if let robotGlitch = self.setupAudioPlayerWithFile("robotflitch", type:"wav") {
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
            button.backgroundColor = UIColor.cyanColor()
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
    //Bass Drop button
    @IBOutlet weak var bassDropButton: UIButton!
    var bassDropLoop = false
    @IBAction func playBassDrop(sender: AnyObject) {
        playSound(bassDrop!, button: bassDropButton, isLoop: &bassDropLoop)
    }
    //Heavy Drop button
    @IBOutlet weak var heavyDropButton: UIButton!
    var heavyDropLoop = false
    @IBAction func playHeavyDrop(sender: AnyObject) {
        playSound(heavyDrop!, button: heavyDropButton, isLoop: &heavyDropLoop)
    }
}

