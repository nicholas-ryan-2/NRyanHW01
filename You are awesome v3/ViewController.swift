//
//  ViewController.swift
//  You are awesome v3
//
//  Created by Nick on 1/23/17.
//  Copyright © 2017 Nick Ryan. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var playSoundSwitch: UISwitch!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var lastMessageIndex: Int = -1
    var lastImageIndex : Int = -1
    let numSounds = 5
    var soundPlayer = AVAudioPlayer()
    var lastSound = -1
    var soundName = -1
    let numImages = 3
    var soundOn = true
    
    func playSound(soundName: String) {
            if let sound = NSDataAsset(name: soundName) {
                //play
                do {
                    try soundPlayer = AVAudioPlayer(data: sound.data)
                    soundPlayer.play()
                    }
                    catch {
                    print("ERROR: File \(soundName) is not a usable sound")
                }
            } else {
                print("ERROR: File \(soundName) could not load.")
            }
        }
    
    @IBAction func switchOff(_ sender: UISwitch) {
        if playSoundSwitch.isOn == true && lastSound != -1 {
            soundPlayer.stop()
        }
    }

    
    func repeatedRandom(last : inout Int, range: Int) -> Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        repeat {
            random = Int(arc4random_uniform(UInt32(range)))
        } while random == last
        last = random
        return random
    }
    @IBAction func messageButton(_ sender: UIButton) {
        let messages = ["You are amazing!",
                        "You are great!",
                        "You are perfect!",
                        "You are wonderful!"]
            imageDisplay.isHidden = false
        //var randomMessageIndex = repeatedRandom(last: &lastIndex, range: messages.count)
        
        //assigning original random values
        var randomSound = Int(arc4random_uniform(UInt32(numSounds)))
        var randomImageIndex = Int(arc4random_uniform(UInt32(numImages)))
        var randomMessageIndex = Int(arc4random_uniform(UInt32(messages.count)))
        
        
        //checking repeating for messages
        /*while Int(lastMessageIndex) == Int(randomMessageIndex) {
            randomMessageIndex = Int(arc4random_uniform(UInt32(messages.count)))
        }
        lastMessageIndex = randomMessageIndex*/
        randomMessageIndex = repeatedRandom(last: &lastMessageIndex, range: messages.count)
        randomImageIndex = repeatedRandom(last: &lastImageIndex, range: numImages)
        randomSound = repeatedRandom(last: &lastSound, range: numSounds)
        imageDisplay.image = UIImage(named: "image" + String(randomImageIndex))
        messageLabel.text = messages[randomMessageIndex]
        if playSoundSwitch.isOn == true {
            playSound(soundName: "sound" + String(randomSound))
        }


        //checking repeating for images
        /*while Int(lastImageIndex) == Int(randomImageIndex) {
            randomImageIndex = Int(arc4random_uniform(UInt32(numImages)))
        }
        lastImageIndex = randomImageIndex*/
        
        
        //random = repeatedRandom(last: &lastImageIndex, range: numImages)
        //imageDisplay.image = UIImage(named: "image" + String(random))
        
        //checking repeating for sounds
        /*while Int(lastSound) == Int(randomSound) {
            randomSound = Int(arc4random_uniform(UInt32(numSounds)))
        }
        lastSound = randomSound*/
        
        /*imageDisplay.image = UIImage(named: "image" + String(randomImageIndex))
        messageLabel.text = messages[randomMessageIndex]
        playSound(soundName: "sound" + String(randomSound))*/


}
}
//method 1 for loop
/*while messageLabel.text == messages[Int(randomIndex)] {
 randomIndex = Int(arc4random_uniform(UInt32(messages.count)))}
 messageLabel.text = messages[Int(randomIndex)]*/

//method 2 for loop
/* repeat {randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
 messageLabel.text = messages[Int(randomIndex)]}
 while previousLabel == messages[randomIndex] */

/*messageLabel.text = messages[index]
 if index == messages.count - 1 {
 index = 0
 } else {
 index += 1*/
