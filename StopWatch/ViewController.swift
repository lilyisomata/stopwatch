//
//  ViewController.swift
//  StopWatch
//
//  Created by Lilico Isomata on 2016/07/09.
//  Copyright © 2016年 Lilico Isomata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func start() {
        if !timer.valid{
            //タイマーが作動していなかったら動かす
        
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target:  self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
        }
            label2.text = ""
    }
    
    func up () {
        //countに0.01（時間経過分）足す
        
        count = count + 0.01
        
        //ラベルに小数点以下２桁まで表示
        label.text = String(format: "%.2f",count)
    }
    
    
    @IBAction func stop() {
        if timer.valid {
            //タイマーが作動していたら停止する
            
            timer.invalidate()
            
            self.hantei()
        }
        
        
    }
    
    @IBAction func reset() {
        if timer.valid {
            timer.invalidate()
        }
         count = 0.00
        label.text = String(format: "%.2f",count)
        label2.text = ""
    }
    
    func hantei() {
        if 9.80 <= count && count <= 10.20 {
            label2.text = "PERFECT!!"
            label2.textColor = UIColor.orangeColor()
        }
    }
    
    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

