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
    var lastIndex: Int = -1
    var lastImageIndex : Int = -1
    let numSounds = 5
    var soundPlayer = AVAudioPlayer()
    var lastSound = String(-1)
    var soundName = -1
    
    func playSound() {
        var soundName = "sound" + String(arc4random_uniform(UInt32(numSounds)))
        if let sound = NSDataAsset(name: soundName) {
            //play
            do {
                try soundPlayer = AVAudioPlayer(data: sound.data)
                soundPlayer.play()
            } catch {
                print("ERROR: File \(soundName) is not a usable sound")
            }
        } else {
            print("ERROR: File \(soundName) could not load.")
        }
        lastSound = soundName
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
                let numImages = 3
        var random = repeatedRandom(last: &lastIndex, range: messages.count)
        messageLabel.text = messages[random]
        random = repeatedRandom(last: &lastImageIndex, range: numImages)
        imageDisplay.image = UIImage(named: "image" + String(random))
        playSound()
        //in trying to add a parameter to the playSound() function, everything broke and randomizing the function made things worse. For now, I've left the function without a parameter and I'll fix it eventually.
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
