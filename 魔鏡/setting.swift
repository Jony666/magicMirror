//
//  setting.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/5.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit
import WebKit

class setting: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var setting_view: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://172.20.10.2:8080/remote.html#settings-menu")
        let request = URLRequest(url: url!)
        setting_view.navigationDelegate = self
        setting_view.load(request)
        // Do any additional setup after loading the view, typically from a nib.
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
