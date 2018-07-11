//
//  exterior.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/7.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit

class exterior: UIViewController {
    @IBOutlet weak var light_slider: UISlider!
    @IBAction func select_light_slider(_ sender: Any) {
        light_slider.value = roundf(light_slider.value)
    }
    @IBOutlet weak var font_size_slider: UISlider!
    @IBAction func select_font_size_slider(_ sender: Any) {
        font_size_slider.value = roundf(font_size_slider.value)
    }
    @IBOutlet weak var font_color_slider: UISlider!
    @IBAction func font_color_slider(_ sender: Any) {
        font_color_slider.value = roundf(font_color_slider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
