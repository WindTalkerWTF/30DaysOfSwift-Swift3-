//
//  ViewController.swift
//  StopWatch
//
//  Created by WindTalker on 2017/8/10.
//  Copyright © 2017年 WindTalker. All rights reserved.
//

/** 定时器的简单使用*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var isPlaying = false;
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        
        timeLabel.text = String(Counter)
        
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func resetButtonDidTouch(_ sender: UIButton) {
        
        Timer.invalidate()
        
        isPlaying = false
        
        Counter = 0
        
        timeLabel.text = String(Counter)
        
        playBtn.isEnabled = true
        
        pauseBtn.isEnabled = true

    }
    
    @IBAction func playButtonDidTouch(_ sender: UIButton) {
        
        if isPlaying {
            return
        }
        
        playBtn.isEnabled = false
        
        pauseBtn.isEnabled = true
        
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        
        isPlaying = true;
        
    }
    
    func UpdateTimer() {
        
        Counter = Counter + 0.1
        
        timeLabel.text = String(format: "%.1f", Counter) //注意小数点的保留小数位，否则会出现异常。
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: UIButton) {
        
        playBtn.isEnabled = true
        
        pauseBtn.isEnabled = false
        
        Timer.invalidate()
        
        isPlaying = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

