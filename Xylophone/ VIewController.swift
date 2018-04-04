//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer!
    
    let sounds = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    let soundExt : String = "wav"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(sounds[sender.tag - 1])
        
    }
    
    func playSound(_ sound: String) {
        
        let soundURL = getNoteURL(sound)
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
            
            player.prepareToPlay()
            player.play()
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func getNoteURL(_ resourceName: String) -> URL {
        return Bundle.main.url(forResource: resourceName, withExtension: soundExt)!
    }
    
    
}
