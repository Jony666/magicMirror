//
//  ViewController.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/3.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isOn = true
   
    @IBAction func `switch`(_ sender: Any) {
        if isOn {
//            let url = URL(string: "http://192.168.211.148:8080/remote?action=MONITOROFF")
//            let _ = URLRequest(url: url!)
//            isOn = !isOn
            
            let url = URL(string: "http://192.168.211.151/cgi-bin/request.cgi")
            do {
                let data = try Data(contentsOf: url!)
                print("ON: \(data)")
                isOn = !isOn
            } catch {
                print(error)
            }
           
            
        } else {
            let url = URL(string: "http://192.168.211.151/cgi-bin/hideAlert.cgi")
            do {
                let data = try Data(contentsOf: url!)
                print("OFF: \(data)")
                isOn = !isOn
            } catch {
                print(error)
            }
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

