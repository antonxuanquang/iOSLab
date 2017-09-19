//
//  ViewController.swift
//  iOSLab2
//
//  Created by Nguyen, Quang on 9/11/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

extension Array {
    func shuffled() -> [Element] {
        var results = [Element]()
        var indexes = (0 ..< count).map { $0 }
        while indexes.count > 0 {
            let indexOfIndexes = Int(arc4random_uniform(UInt32(indexes.count)))
            let index = indexes[indexOfIndexes]
            results.append(self[index])
            indexes.remove(at: indexOfIndexes)
        }
        return results
    }
    
}

class ViewController: UIViewController {
    
    
    var question_list: [Question] = []
    var current_index = 0

    @IBOutlet weak var lbl_question_num: UILabel!
    @IBOutlet weak var lbl_question_text: UILabel!
    @IBOutlet weak var lbl_optionA: UILabel!
    @IBOutlet weak var lbl_optionB: UILabel!
    @IBOutlet weak var lbl_optionC: UILabel!
    @IBOutlet weak var lbl_optionD: UILabel!
    @IBOutlet weak var btn_optionA: UIButton!
    @IBOutlet weak var btn_optionB: UIButton!
    @IBOutlet weak var btn_optionC: UIButton!
    @IBOutlet weak var btn_optionD: UIButton!
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        new_game()
    }
    
    func generate_question(_ raw_quetion: [String:String]) -> Question {
        let question = Question()
        question.correctAnswer = Option(rawValue: raw_quetion["Answer"]!)
        question.optionA = raw_quetion["A"]!
        question.optionB = raw_quetion["B"]!
        question.optionC = raw_quetion["C"]!
        question.optionD = raw_quetion["D"]!
        question.question = raw_quetion["question"]!
        
        return question
    }
    
    @IBAction func btn_optionA_touchDown(_ sender: UIButton) {
        question_list[current_index].userAnswer = Option(rawValue: "A")
        current_index += 1
        render()
    }
    
    @IBAction func btn_optionB_touchDown(_ sender: UIButton) {
        question_list[current_index].userAnswer = Option(rawValue: "B")
        current_index += 1
        render()
    }
    
    
    @IBAction func btn_optionC_touchDown(_ sender: UIButton) {
        question_list[current_index].userAnswer = Option(rawValue: "C")
        current_index += 1
        render()
    }
    
    @IBAction func btn_optionD_touchDown(_ sender: UIButton) {
        question_list[current_index].userAnswer = Option(rawValue: "D")
        current_index += 1
        render()
    }
    
    
    @IBAction func btn_back_touchDown(_ sender: UIButton) {
        current_index -= 1
        render()
    }
    
    
    
    @IBAction func btn_next_touchDown(_ sender: UIButton) {
        current_index += 1
        if current_index >= 9 {
            performSegue(withIdentifier: "finalView", sender: nil)
        } else {
            render()
        }
    }
    
    func render() {
        if current_index == 10 {
            performSegue(withIdentifier: "finalView", sender: nil)
        } else {
            let question = question_list[current_index]
            lbl_question_num.text = "Question \(current_index + 1)"
            lbl_question_text.text = question.question
            lbl_optionA.text = question.optionA
            lbl_optionB.text = question.optionB
            lbl_optionC.text = question.optionC
            lbl_optionD.text = question.optionD
            
            if current_index == 0 {
                btn_back.isHidden = true
            } else {
                btn_back.isHidden = false
            }
        }
        
        
    }
    
    func new_game() {
        static_question_list = static_question_list.shuffled()
        question_list = []
        for i in 0..<10 {
            question_list.append(generate_question(static_question_list[i]))
        }
        current_index = 0
        render()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finalView" {
            print(segue.destination)
            let finalView = segue.destination as! FinalViewController
            finalView.question_list = question_list
        }
    }
    
    var static_question_list = [
        [
            "question": "In Swift, a sequence of characters surrounded by double quotes is called a ____.",
            "A": "String Literal",
            "B": "Global Variable",
            "C": "Special Character",
            "D": "Literal Expression",
            "Answer": "A"
        ],
        [
            "question": "The Iphone has a feature that activates when you rotate the device from portrait to landscape.",
            "A": "Rotator",
            "B": "Accelerometer",
            "C": "Shadow detector",
            "D": "Special Sensor",
            "Answer": "B"
        ],
        [
            "question": "iOS was first released in?",
            "A": "2008",
            "B": "2005",
            "C": "2006",
            "D": "2007",
            "Answer": "D"
        ],
        [
            "question": "What type of software is iOS?",
            "A": "Proprietary",
            "B": "Open-source",
            "C": "Secret",
            "D": "None of these",
            "Answer": "A"
        ],
        [
            "question": "Multitasking for iOS was first released in which year?",
            "A": "2010",
            "B": "2008",
            "C": "2012",
            "D": "2011",
            "Answer": "A"
        ],
        [
            "question": "Which keyword do you use to declare enumeration?",
            "A": "var",
            "B": "let",
            "C": "enum",
            "D": "e(num)",
            "Answer": "C"
        ],
        [
            "question": "A class that's defined solely so that other classes can inherit from it?",
            "A": "Anonymous object",
            "B": "Abstract class",
            "C": "ARC",
            "D": "Binary",
            "Answer": "B"
        ],
        [
            "question": "An object of unknown class. Interface is published through protocol declaration?",
            "A": "Protocols",
            "B": "Unsigned",
            "C": "Anonymous Object",
            "D": "Reciever",
            "Answer": "C"
        ],
        [
            "question": "_____ allows you to add new methods to existing classes",
            "A": "Categories",
            "B": "Dangling Pointer",
            "C": "Factory",
            "D": "Memory Leak",
            "Answer": "A"
        ],
        [
            "question": "_____ operators take a single operand",
            "A": "Long long",
            "B": "Framework",
            "C": "Unitary",
            "D": "Enumeration",
            "Answer": "C"
        ],
        [
            "question": "A ____ method is one that is likely to be unsupported in the future?",
            "A": "Categories",
            "B": "deprecated",
            "C": "delegate",
            "D": "Enumerations",
            "Answer": "B"
        ],
        [
            "question": "A ____ ____ is where you free memory and then accidentally continue to use it",
            "A": "dangling pointer",
            "B": "Unsigned",
            "C": "procedural language",
            "D": "nonatomic",
            "Answer": "A"
        ],
        [
            "question": "A set of method definitions that is segregated from the rest of the class definition?",
            "A": "instance",
            "B": "category",
            "C": "Unsigned",
            "D": "protocol",
            "Answer": "B"
        ],
        [
            "question": "A method that can operate on class objects rather than instances of the class",
            "A": "instance",
            "B": "class method",
            "C": "zero",
            "D": "%",
            "Answer": "B"
        ],
        [
            "question": "What element can be used to learn more information about a declaration or type?",
            "A": "Attribute",
            "B": "Expressive",
            "C": "Details",
            "D": "Contains",
            "Answer": "C"
        ],
        [
            "question": "The ____ operator appends to one of two different values depending on the value of a condition.",
            "A": "Decleration",
            "B": "Preset",
            "C": "Ternary Conditional",
            "D": "I don't know",
            "Answer": "C"
        ],
        [
            "question": "In Swift, there are three kinds of statements: simple, compiler control,and ____.",
            "A": "Control Flow",
            "B": "Soluble",
            "C": "Primary",
            "D": "Tagged",
            "Answer": "A"
        ],
        [
            "question": "The expression that creates a closure in Swift is called ____; in other languages it is also called a Lambda or Anonymous Function.",
            "A": "Control",
            "B": "Closure Expression",
            "C": "Defined",
            "D": "Parameter",
            "Answer": "B"
        ],
        [
            "question": "What do you use to control how values are captured in a closure?",
            "A": "Boxes",
            "B": "Pokeball",
            "C": "Tables",
            "D": "Capture Lists",
            "Answer": "A"
        ],
        [
            "question": "What element is used by declarations and control structures to group multiple statements together?",
            "A": "Switch",
            "B": "Adhesive",
            "C": "Merger",
            "D": "Code Blocks",
            "Answer": "D"
        ],
        [
            "question": "What symbol is used to end a statement, and separate multiple statements in a single line?",
            "A": "semicolon",
            "B": "period",
            "C": "comma",
            "D": "parenthesis",
            "Answer": "A"
        ]
    ]


}

class Question {
    var question = "Question"
    var optionA = "Option A"
    var optionB = "Option B"
    var optionC = "Option C"
    var optionD = "Option D"
    
    var correctAnswer: Option?
    var userAnswer: Option?
    
}

enum Option: String {
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
}


