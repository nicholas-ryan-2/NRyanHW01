//
//  ViewController.swift
//  You are awesome v3
//
//  Created by Nick on 1/23/17.
//  Copyright © 2017 Nick Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    var randomIndex = -1
    @IBAction func messageButton(_ sender: UIButton) {
                let messages = ["You are amazing!",
                        "You are great!",
                        "You are perfect!",
                        "You are wonderful!"]
        let previousLabel = messageLabel.text
        //method 1 for loop
        /*while messageLabel.text == messages[Int(randomIndex)] {
            randomIndex = Int(arc4random_uniform(UInt32(messages.count)))}
        messageLabel.text = messages[Int(randomIndex)]*/
        
       //method 2 for loop
        repeat {randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
        messageLabel.text = messages[Int(randomIndex)]}
        while previousLabel == messages[randomIndex]
        
        /*messageLabel.text = messages[index]
        if index == messages.count - 1 {
            index = 0
        } else {
            index += 1*/
        
}
}
