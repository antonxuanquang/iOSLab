//
//  ViewController.swift
//  iOSLab6
//
//  Created by Nguyen, Quang on 11/9/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var appDelegate: AppDelegate!
    
    @IBAction func intervalChange(_ sender: UISlider) {
        appDelegate.timeInterval = Int(sender.value)
        print(appDelegate.timeInterval)
    }
    @IBOutlet weak var oneSecond: UILabel!
    @IBOutlet weak var twoSecond: UILabel!
    @IBOutlet weak var threeSecond: UILabel!
    
    @IBAction func nameChange(_ sender: UITextField) {
        appDelegate.userName = sender.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let app = UIApplication.shared
        appDelegate = app.delegate as! AppDelegate
        
        let userDefaults = UserDefaults.standard
        
        if let one_score = userDefaults.object(forKey: "one_score") as? Int,
            let one_name = userDefaults.object(forKey: "one_name") as? String {
            oneSecond.text = "\(one_name) - \(one_score)"
        }
        
        if let two_score = userDefaults.object(forKey: "two_score") as? Int,
            let two_name = userDefaults.object(forKey: "two_name") as? String {
            twoSecond.text = "\(two_name) - \(two_score)"
        }
        
        if let three_score = userDefaults.object(forKey: "three_score") as? Int,
            let three_name = userDefaults.object(forKey: "three_name") as? String {
            threeSecond.text = "\(three_name) - \(three_score)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

