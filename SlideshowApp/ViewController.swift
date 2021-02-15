

import UIKit

class ViewController: UIViewController {
   
    
    
let images = [
         UIImage(named: "マルチーズ.JPG"),
         UIImage(named: "コーギー.jpeg"),
         UIImage(named: "ゴールデン.jpeg")
         ]
    
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
            let next = segue.destination as? secondViewController
        next?.Image = self.imageView.image!
        print(self.imageView.image!)
    }
    
    
    var nowIndex:Int = 0
    
    //間隔処理タイマー
    var timer: Timer!
    
    //表示画像番号
    var dispImageNo = 0
    
    //表示番号元に画像を表示
    func displayImage() {
        
        
        imageView.image = images[dispImageNo]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = images[0]
        imageView.image = image
     
        
    }
    
    //２秒間隔で呼び出される関数
    func onTimer(timer: Timer) {
        print("onTimer")
    }
    
    //再生ボタン
    @IBAction func startButton(_sender: Any) {
        if self.timer != nil {
            
           backButton.setTitleColor(UIColor.lightGray, for: .normal)
           nextButton.setTitleColor(UIColor.lightGray, for: .normal)
            
           startButton.setTitle("再生", for: UIControl.State.normal)
            //タイマー停止
           timer?.invalidate()
            
         timer = nil
        
       } else {
           startButton.setTitle("停止", for: UIControl.State.normal)
            
            //タイマー設定
           timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
        backButton.isEnabled = false
         backButton.setTitleColor(UIColor.lightGray, for: .normal)
            
            nextButton.isEnabled = false
           nextButton.setTitleColor(UIColor.lightGray, for: .normal)
            
            
            
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func changeImage() {
       
           print("onTimer")
        
            
        if dispImageNo > 1  {
           dispImageNo = 0
            displayImage()
        }else {
            dispImageNo += 1
            displayImage()

            
        
       }
    }
    //戻るボタン
    @IBAction func BackButton(_sender: Any) {
        if nowIndex == 0 {
            nowIndex = 2
        } else {
            nowIndex -= 1
        }
        imageView.image = images[nowIndex]
    }
    
    //進むボタン
    @IBAction func NextButton(_sender: Any) {
        if nowIndex == 2 {
            nowIndex = 0
        } else {
            nowIndex += 1
        }
        imageView.image = images[nowIndex]
    }
    @IBAction func backToTitle(sender: UIStoryboardSegue) {
        
    }
    

}

