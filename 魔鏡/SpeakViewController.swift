import UIKit

class SpeakViewController: UIViewController {

    @IBOutlet weak var bnTalk: UIButton!
    @IBOutlet weak var bnRecognser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bnTalk.layer.cornerRadius = 75
        bnRecognser.layer.cornerRadius = 75
    }
    
    @IBAction func onTalk(_ sender: UIButton) {
        bnTalk.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
        bnRecognser.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.7)
    }
    
    @IBAction func onStopTalk(_ sender: UIButton) {
        bnRecognser.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
        bnTalk.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.7)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
