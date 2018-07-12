//
//  ViewController.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/3.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isOn = false
   
    @IBAction func `switch`(_ sender: Any) {
        if isOn {
            let url = URL(string: "http://172.20.10.5:8080/remote?action=MONITORON")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
            isOn = !isOn
            
        } else {
            let url = URL(string: "http://172.20.10.5:8080/remote?action=MONITOROFF")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
            isOn = !isOn
        }
    }
    
    
    override func viewDidLoad() {
      
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

