//
//  exterior.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/7.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit

class exterior: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var light_slider: UISlider!
    @IBAction func select_light_slider(_ sender: UISlider) {
        light_slider.value = roundf(light_slider.value)
//
        switch light_slider.value {
        case 1:
            let url = URL(string: "http://172.20.10.2:8080/remote?action=BRIGHTNESS&value=40")
                do {
                    let _ = try String(contentsOf: url!)
                } catch {
                    print(error)
                }
        case 2:
            let url = URL(string: "http://172.20.10.2:8080/remote?action=BRIGHTNESS&value=80")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        case 3:
            let url = URL(string: "http://172.20.10.2:8080/remote?action=BRIGHTNESS&value=120")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
            
        case 4:
            let url = URL(string: "http://172.20.10.2:8080/remote?action=BRIGHTNESS&value=160")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        case 5:
            let url = URL(string: "http://172.20.10.2:8080/remote?action=BRIGHTNESS&value=200")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        default:
            let url = URL(string: "http://172.20.10.2:8080/remote?action=BRIGHTNESS&value=100")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        }
    }
    
    @IBOutlet weak var font_size_slider: UISlider!
    
    @IBAction func select_font_size_slider(_ sender: UISlider) {
        font_size_slider.value = roundf(font_size_slider.value)
    }
    
    @IBOutlet weak var font_color_slider: UISlider!
    
    @IBAction func font_color_slider(_ sender: UISlider) {
        font_color_slider.value = roundf(font_color_slider.value)
        switch font_color_slider.value {
        case 1:
            let url = URL(string: "http://172.20.10.2/cgi-bin/editCustomCss.py?colour=pink")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        case 2:
            let url = URL(string: "http://172.20.10.2/cgi-bin/editCustomCss.py?colour=blue")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        case 3:
            let url = URL(string: "http://172.20.10.2/cgi-bin/editCustomCss.py")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }

        case 4:
            let url = URL(string: "http://172.20.10.2/cgi-bin/editCustomCss.py?colour=yellow")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        case 5:
            let url = URL(string: "http://172.20.10.2/cgi-bin/editCustomCss.py?colour=lightgreen")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        default:
            let url = URL(string: "https://stackoverflow.com/questions/38874517/how-to-make-a-simple-rounded-button-in-storyboard")
            do {
                let _ = try String(contentsOf: url!)
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func apply(_ sender: UIButton) {
        let url = URL(string: "http://172.20.10.2/cgi-bin/restartTheMirror.cgi")
        do {
            let _ = try String(contentsOf: url!)
        } catch {
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = 10
        myButton.clipsToBounds = true
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
