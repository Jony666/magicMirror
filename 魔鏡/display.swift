//
//  display.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/5.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit
import WebKit

class display: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var display_view: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://192.168.211.148:8080")
        let request = URLRequest(url: url!)
        
        display_view.navigationDelegate = self
        display_view.load(request)
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
