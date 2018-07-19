import UIKit
import Speech

class SpeakViewController: UIViewController {
    
    @IBOutlet weak var bnTalk: UIButton!
    @IBOutlet weak var bnRecognser: UIButton!
    
    let recogniser = SFSpeechRecognizer(locale: Locale(identifier: "zh_Hant_Tw"))!
    let tmpURL = URL(fileURLWithPath: NSTemporaryDirectory() + "audio.m4a")
    var audioRecorder:  AVAudioRecorder?
    
    var actionURL = "http://172.20.10.2:8080/remote?action="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bnTalk.layer.cornerRadius = 75
        bnRecognser.layer.cornerRadius = 75
        
        SFSpeechRecognizer.requestAuthorization { (status) in
            switch status{
            case .authorized:
                DispatchQueue.main.async {
                    self.bnTalk.isEnabled = true
                }
            default:
                DispatchQueue.main.async {
                    self.bnTalk.isEnabled = false
                }
            }
        }
        
        let settings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC)
        ]
        
        audioRecorder = try! AVAudioRecorder(url: tmpURL, settings: settings)
    }
    
    @IBAction func onTalk(_ sender: UIButton) {
        bnTalk.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
        bnRecognser.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.7)
        
        if let audioRecorder = audioRecorder {
            
            let session = AVAudioSession.sharedInstance()
            do {
                try session.setCategory(AVAudioSessionCategoryRecord)
                try session.setMode(AVAudioSessionModeMeasurement)
                try session.setActive(true, with: .notifyOthersOnDeactivation)
            } catch {
                print("session 設定錯誤: \(error)")
            }
            
            audioRecorder.record()
            bnTalk.isEnabled = false
            bnRecognser.isEnabled = true
        }
    }
    
    @IBAction func onStopTalk(_ sender: UIButton) {
        bnRecognser.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
        bnTalk.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.7)
        
        if let audioRecorder = audioRecorder {
            audioRecorder.stop()
            
            //Use the SFSpeechURLRecognitionRequest class to perform recognition on a prerecorded, on-disk audio file
            let request = SFSpeechURLRecognitionRequest(url: tmpURL)
            
            recogniser.recognitionTask(with: request) { (result, error) in
                self.bnTalk.isEnabled = true
                self.bnRecognser.isEnabled = false
                
                //The result of recognition
                if let result = result {
                    if result.isFinal {
                        let text = result.bestTranscription.formattedString
                        
                        if text.contains("顯示地球") {
                            self.executeAction(isShown: true, module: "module_9_MMM-Globe")
                        }
                        
                        if text.contains("隱藏地球") {
                            self.executeAction(isShown: false, module: "module_9_MMM-Globe")
                        }
                        
                        if text.contains("顯示日曆") {
                            self.executeAction(isShown: true, module: "module_3_calendar")
                        }
                        
                        if text.contains("隱藏日曆") {
                            self.executeAction(isShown: false, module: "module_3_calendar")
                        }
                        
                    }
                }
            }
        }
    }
    
    //    http://172.20.10.5:8080/remote?action=SHOW&module=module_9_MMM-Globe
    
    func executeAction(isShown: Bool,  module: String) {
        
        var url :URL? = nil
        
        if isShown {
            url = URL(string: actionURL + "SHOW&module=\(module)")
            
            //            let alert = UIAlertController(title: nil, message: actionURL + "SHOW&module=\(module)", preferredStyle: .actionSheet)
            //            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            //
            //            alert.addAction(action)
            //
            //            present(alert, animated: true, completion: nil)
        } else {
            url  = URL(string: actionURL + "HIDE&module=\(module)")
            print("隱藏:\(url)")
        }
        
        //Threading
        //        DispatchQueue.global().async {
        //            if let url = url {
        //                do {
        //                    let _ = try String(contentsOf: url)
        //                } catch {
        //                    print(error)
        //                }
        //            } else {
        //                print("Incorrect URL")
        //            }
        //        }
        
        DispatchQueue.global().async {
            let _ = try! String(contentsOf: url!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
