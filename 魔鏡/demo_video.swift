//
//  demo_video.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/11.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit
import AVKit

class demo_video: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func message_video(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "globe", ofType: "mov"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let video_player = AVPlayerViewController()
            video_player.player = video
            
            present(video_player, animated: true, completion: {
                video.play()
            })
        }
    }
    
    @IBAction func display_video(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "globe", ofType: "mov"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let video_player = AVPlayerViewController()
            video_player.player = video
            
            present(video_player, animated: true, completion: {
                video.play()
            })
        }
    }
    
    @IBAction func exterior_video(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "preferences", ofType: "mov"){
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let video_player = AVPlayerViewController()
            video_player.player = video
            
            present(video_player, animated: true, completion: {
                video.play()
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
