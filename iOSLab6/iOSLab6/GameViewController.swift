//
//  GameViewController.swift
//  iOSLab6
//
//  Created by Nguyen, Quang on 11/9/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var appDelegate: AppDelegate!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    var numberOfActions = 1
    var currentIndex = 0
    var currentShowIndex = 0
    var listOfActions = ["Swipe Left", "Swipe Right", "Pinch", "Double Tap"]
    var listOfRandomActions: [String] = []
    var hideAction = false
    var displayTimer = Timer()
    var waitTimer = Timer()
    var currentTime = 1
    var timeInterval: Int?
    
    @IBOutlet weak var lblAction: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UIApplication.shared
        appDelegate = app.delegate as! AppDelegate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        appDelegate.score = 0
        timeInterval = appDelegate.timeInterval
        numberOfActions = 1
        lblTimer.text = "0"
        lblScore.text = "0"
        lblAction.text = "Ready"
        resetGame()
    }
    
    func resetGame() {
        currentIndex = 0
        currentShowIndex = 0
        lblTimer.text = "0"
        waitTimer.invalidate()
        displayTimer.invalidate()
        generateActions()
        displayActions()
    }
    
    @IBAction func wrongAction(_ sender: Any) {
        checkGesture("wrong action")
    }
    
    
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        checkGesture("Double Tap")
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        checkGesture("Swipe Right")
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        checkGesture("Swipe Left")
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .ended {
            checkGesture("Pinch")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateActions() {
        listOfRandomActions = []
        for _ in 0..<numberOfActions {
            listOfRandomActions.append(listOfActions[Int(arc4random_uniform(UInt32(listOfActions.count)))])
        }
    }
    
    func gameOver() {
        waitTimer.invalidate()
        performSegue(withIdentifier: "gameOver", sender: self)
    }
    
    func checkGesture(_ gesture: String) {
        if !waitTimer.isValid {return;}
        
        if gesture == listOfRandomActions[currentIndex] {
            currentIndex = currentIndex + 1
            appDelegate.score = appDelegate.score + numberOfActions
            lblScore.text = "\(appDelegate.score)"
            if currentIndex == numberOfActions {
                numberOfActions = numberOfActions + 1
                resetGame()
            } else {
                playGame()
            }
        } else {
            gameOver()
        }
    }
    
    func timeChange() {
        if currentTime == timeInterval {
            gameOver()
        }
        currentTime = currentTime + 1
        lblTimer.text = "\(currentTime)"
    }
    
    func playGame() {
        currentTime = 0
        lblTimer.text = "0"
        waitTimer.invalidate()
        waitTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeChange), userInfo: nil, repeats: true)
    }
    
    func displayAction() {
        if hideAction {
            currentShowIndex = currentShowIndex + 1
            if currentShowIndex == listOfRandomActions.count {
                currentShowIndex = 0
                displayTimer.invalidate()
                playGame()
            }
        }
        lblAction.text = listOfRandomActions[currentShowIndex]
        lblAction.isHidden = hideAction
        hideAction = !hideAction
    }
    
    func displayActions() {
        displayTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayAction), userInfo: nil, repeats: true)
    }
}
