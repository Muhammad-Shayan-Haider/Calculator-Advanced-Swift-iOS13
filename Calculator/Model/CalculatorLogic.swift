//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Muhammad Shayyan on 31/10/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func calculate(symbol: String) -> Double? {
        if let number {
            if symbol == "+/-" {
                return number * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return number * 0.01
            } else if symbol == "=" {
                return performTwoNumCalculation(n2: number)
            } else {
                intermediateCalculation = (n1: number, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Invalid operation")
            }
        }
        return nil
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
}
