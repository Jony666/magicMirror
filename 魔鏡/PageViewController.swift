import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var app = UIApplication.shared.delegate as! AppDelegate
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

        // vc3 ~ vc6 為介紹頁面
        
        view.backgroundColor = UIColor.white
        
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        let vc5 = storyboard?.instantiateViewController(withIdentifier: "vc5")
        let vc6 = storyboard?.instantiateViewController(withIdentifier: "vc6")
       
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

}
