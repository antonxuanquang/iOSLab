//
//  FinalViewController.swift
//  iOSLab2
//
//  Created by Nguyen, Quang on 9/14/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var question_list: [Question] = []
    
    @IBOutlet weak var lbl_answer: UILabel!
    @IBOutlet weak var lbl_correct: UILabel!
    @IBOutlet weak var lbl_wrong: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var answer_count = 0
        var correct_count = 0
        for question in question_list {
            if question.userAnswer != nil {
                answer_count += 1
                if question.userAnswer == question.correctAnswer {
                    correct_count += 1
                }
            }
        }
        lbl_answer.text = "Answered: \(answer_count)"
        lbl_correct.text = "Correct: \(correct_count)"
        lbl_wrong.text = "Wrong \(answer_count - correct_count)"
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
