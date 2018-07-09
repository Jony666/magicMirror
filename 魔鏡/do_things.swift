//
//  do_things.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/9.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit

class do_things: UIViewController {
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var my_title: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        content.layer.borderWidth = 0.5
        content.layer.cornerRadius = 8
        content.layer.borderColor = UIColor.lightGray.cgColor
        
        my_title.layer.borderWidth = 0.5
        my_title.layer.cornerRadius = 5
        my_title.layer.borderColor = UIColor.lightGray.cgColor
        
        self.hideKeyboardWhenTappedAround() 
        
    }
  
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       
        }

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


