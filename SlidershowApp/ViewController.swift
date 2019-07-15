//
//  ViewController.swift
//  SlidershowApp
//
//  Created by 五十嵐諒太 on 2019/07/11.
//  Copyright © 2019 ikarashiryota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //画像ファイル定義
    let images = [UIImage(named:"image1"),UIImage(named:"image2"),UIImage(named:"image3")]
    
    var index = 0
    
    
    var timer: Timer!
    
    
    @IBOutlet weak var image1: UIImageView!
    
      //var images: [UIImage] = [img1, img2, img3]
    //進むボタン
    @IBAction func next(_ sender: UIButton){
    //    image1.image = img1
        
      
        index += 1
        
        if index >= 3{
        index = 0
        }
        image1.image = images[index]    }
    
    
    //戻るボタン
    @IBAction func back(_ sender: UIButton) {
        
        index -= 1
        
        if index < 0 {
            index = 2
        }
        image1.image = images[index]     }
    
    
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    //再生/停止ボタン
    @IBAction func
        startstop(_ sender: UIButton) {
            
        //タイマーの作成、始動
        if timer == nil {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.updateTimer(_:)), userInfo: nil, repeats: true)
            button3.setTitle("停止", for: .normal)
            
            // 無効化
            button1.isEnabled = false
            button2.isEnabled = false
            
        }else {
            timer.invalidate()
            timer = nil
            button3.setTitle("再生", for: .normal)
            
            //有効化
            button1.isEnabled = true
            button2.isEnabled = true
            
        }
    
        }
    
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image1.image = images[index]    }
    @objc func updateTimer(_ timer:Timer) {
        self.timer_sec += 1.0
        
        
        index += 1
        
        if index >= 3{
            index = 0
        }
        image1.image = images[index]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.x = images[index]
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}
