//
//  GameOverViewController.swift
//  iOSLab6
//
//  Created by Nguyen, Quang on 11/9/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

struct Score {
    var score: Int = 0
    var name: String = ""
    
}

class GameOverViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    var appDelegate: AppDelegate!
    var rank: String = ""
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.shared
        // Do any additional setup after loading the view.
        
        appDelegate = app.delegate as! AppDelegate
        lblScore.text = "Your Score \(appDelegate.score)"
        
        
        let timeInterval = appDelegate.timeInterval
        if timeInterval == 1 {
            rank = "one"
        } else if timeInterval == 2 {
            rank = "two"
        } else {
            rank = "three"
        }
        
        if let score = userDefaults.object(forKey: "\(rank)_score") as? Int {
            if score < appDelegate.score {
                updateScore()
            }
        } else {
            updateScore()
        }
    }
    
    func updateScore() {
        userDefaults.set(appDelegate.score, forKey: "\(rank)_score")
        userDefaults.set(appDelegate.userName, forKey: "\(rank)_name")
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
