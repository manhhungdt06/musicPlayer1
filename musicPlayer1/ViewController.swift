//
//  ViewController.swift
//  musicPlayer1
//
//  Created by techmaster on 10/27/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var btn_play: UIButton!
    @IBOutlet weak var sld_vol: UISlider!
    var audio = AVAudioPlayer()
    var isPlaying = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "music_", ofType: "mp3")!))
        audio.prepareToPlay()
        addSliderImg()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSliderImg() {
        sld_vol.setThumbImage(UIImage(named: "thumb.png"), for: .normal)
        sld_vol.setThumbImage(UIImage(named: "thumbHightLight.png"), for: .highlighted)
    }
    
    @IBAction func action_play(_ sender: UIButton) {
        if isPlaying {
            audio.play()
            btn_play.setImage(UIImage(named: "pause.png"), for: UIControlState())
        }
        else {
            audio.pause()
            btn_play.setImage(UIImage(named: "play.png"), for: UIControlState())
        }
        isPlaying = !isPlaying
    }
    
    @IBAction func action_slider(_ sender: UISlider) {
        audio.volume = sender.value
    }
}

