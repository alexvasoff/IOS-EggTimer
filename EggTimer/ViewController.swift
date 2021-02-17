//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    
    let eggTimes = ["Soft":5, "Medium":7, "Hard":12]
    var counter: Int = 0
    var timer: Timer = Timer()
    var selectedHardnessTime = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var labelTextChange: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(sender.currentTitle!)
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!
        selectedHardnessTime = counter
        timer.invalidate()
        progressBar.progress = 0.0
        labelTextChange.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
      //labelTextChange.text = String(counter)
            counter -= 1
            print("\(counter) seconds to the end")
            let rem = Float((selectedHardnessTime - counter))/Float(selectedHardnessTime)
            progressBar.progress = rem
            
            
        }
        else {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            print("I continue to work")
            timer.invalidate()
        }
        
    }
    
}
