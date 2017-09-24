//
//  ViewController.swift
//  iOSLab3
//
//  Created by Nguyen, Quang on 9/24/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    var inTypingmode: Bool = false
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.adjustsFontSizeToFitWidth = true
        display.minimumScaleFactor = 0.2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pressDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if inTypingmode {
            let textInDisplay = display.text!
            display.text = textInDisplay + digit
        } else {
            display.text = digit
            inTypingmode = true
        }
    }
    
    private var calculatorModel = CalculatorModel()
    
    @IBAction func unaryOperation(_ sender: UIButton) {
        if inTypingmode {
            calculatorModel.setOperand(displayValue)
            inTypingmode = false
        }
        if let mathOp = sender.currentTitle {
            calculatorModel.performOperation(mathOp)
        }
        if let result = calculatorModel.result {
            displayValue = result
        }
    }
    
    
    @IBAction func binaryOperation(_ sender: UIButton) {
        calculatorModel.setOperand(displayValue)
        if let mathOperator = sender.currentTitle {
            calculatorModel.setOperator(mathOperator)
            inTypingmode = false
        }
    }
    
    
    @IBAction func equalOperation(_ sender: UIButton) {
        print(calculatorModel.result!, calculatorModel.currentOperator!, displayValue)
        calculatorModel.performOperation(calculatorModel.currentOperator!, secondOperand: displayValue)
        if let result = calculatorModel.result {
            displayValue = result
        }
    }
}

