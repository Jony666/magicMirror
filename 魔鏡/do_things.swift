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
    let datePicker = UIDatePicker()
    @IBOutlet weak var content_text: UITextField!
    @IBOutlet weak var myTitle: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        content.layer.borderWidth = 0.5
        content.layer.cornerRadius = 8
        content.layer.borderColor = UIColor.lightGray.cgColor
        
        myTitle.layer.borderWidth = 0.5
        myTitle.layer.cornerRadius = 5
        myTitle.layer.borderColor = UIColor.lightGray.cgColor
        
        datePicker.locale = Locale(identifier: "zh_TW")
        createDatePicker()
        
        self.hideKeyboardWhenTappedAround()

    }
    func createDatePicker () {
        datePicker.datePickerMode = .dateAndTime
        content_text.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        
        
        let goRight = UIBarButtonItem(barButtonSystemItem:     UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([goRight, button], animated: true)
        content_text.inputAccessoryView = toolbar
    }
    @objc func doneClicked () {
        let dateForatter = DateFormatter()
        dateForatter.dateStyle = .medium
        dateForatter.timeStyle = .medium
        content_text.text = dateForatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
  
    @IBAction func confirm(_ sender: Any) {
        // 確認送出資料
    }
    @IBAction func stop(_ sender: Any) {
        // 取消通知視窗
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


