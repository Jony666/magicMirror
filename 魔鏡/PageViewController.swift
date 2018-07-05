//
//  PageViewController.swift
//  魔鏡
//
//  Created by Jony Wang on 2018/7/3.
//  Copyright © 2018年 Jony. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var list = [UIViewController]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for v in view.subviews{
            if v is UIScrollView{
                v.frame = view.bounds
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // vc1 ~ vc6 為介紹頁面 ， vc7 為開始介面。
        
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "vc1")
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2")
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        let vc5 = storyboard?.instantiateViewController(withIdentifier: "vc5")
        let vc6 = storyboard?.instantiateViewController(withIdentifier: "vc6")
        
        
        list.append(vc1!)
        list.append(vc2!)
        list.append(vc3!)
        list.append(vc4!)
        list.append(vc5!)
        list.append(vc6!)
        
        
        
        setViewControllers([list[0]], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = list.index(of: viewController), index > 0 {
            return list[index - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = list.index(of: viewController), index < list.count - 1 {
            return list[index + 1]
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
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
