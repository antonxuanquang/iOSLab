//
//  CalculatorModel.swift
//  iOSLab3
//
//  Created by Nguyen, Quang on 9/24/17.
//  Copyright © 2017 Nguyen, Quang. All rights reserved.
//

import Foundation

struct CalculatorModel {
    private var accumulator: Double?
    private var mathOperator: String?
    private var secondOperand: Double?
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    var currentOperator: String? {
        get {
            return mathOperator
        }
    }
    
    mutating func setOperator(_ mathOperator: String) {
        self.mathOperator = mathOperator
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    mutating func setSecondOperand(_ operand: Double) {
        secondOperand = operand
    }
    
    mutating func performOperation(_ symbol: String) {
        switch symbol {
        case "+/-":
            if let operand = accumulator {
                accumulator = operand * -1
            }
        case "%":
            if let operand = accumulator {
                accumulator = operand / 100
            }
        case "C":
            if accumulator != nil {
                accumulator = 0
            }
            mathOperator = ""
            if secondOperand != nil {
                secondOperand = nil
            }
        case "+":
            if let operand = accumulator {
                accumulator = operand + secondOperand!
            }
        case "-":
            if let operand = accumulator {
                accumulator = operand - secondOperand!
            }
        case "*":
            if let operand = accumulator {
                accumulator = operand * secondOperand!
            }
        case "÷":
            if let operand = accumulator {
                accumulator = operand / secondOperand!
            }
        default:
            break
        }
    }
}
