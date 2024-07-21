////
////  PractiseFile.swift
////  CalculatorApp
////
////  Created by Abdullah INAN on 14/07/2024.
////
//
//import UIKit
//
//class PractiseFile: UIViewController {
//    
//    @IBOutlet var resultLabel: UILabel!
//    @IBOutlet var buttons: [UIButton]!
//    
//    var currentNumber = "0"
//    var previousNumber = ""
//    var currentOperation = ""
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        updateResultNumber()
//        roundButtons()
//        
//    }
//    
//    func roundButtons() {
//        for button in buttons {
//            button.layer.cornerRadius = button.bounds.size.height / 2
//            button.clipsToBounds = true
//        }
//    }
//    
//    
//    @IBAction func digitTapped(_ sender: UIButton) {
//        guard let digit = sender.currentTitle else { return }
//        
//        if currentNumber == "0" {
//            currentNumber = digit
//        } else {
//            currentNumber += digit
//        }
//        
//        resultLabel.text = currentNumber
//        updateResultNumber()
//    }
//    
//    @IBAction func operationTapped(_ sender: UIButton) {
//        guard let operation = sender.currentTitle else { return }
//        previousNumber = currentNumber
//        currentNumber = "0"
//        currentOperation = operation
//    }
//    
//    @IBAction func equalTapped(_ sender: UIButton) {
//        guard let previous = Double(previousNumber), let current = Double(currentNumber) else { return }
//        var result: Double = 0.0
//        
//        switch currentOperation {
//        case "+":
//            result = previous + current
//        case "-":
//            result = previous - current
//        case "x":
//            result = previous * current
//        case "/":
//            if current != 0 {
//                result = previous / current
//            } else {
//                resultLabel.text = "error"
//            }
//        default:
//            return
//        }
//        
//        currentNumber = formattedNumber(result)
//        updateResultNumber()
//    }
//    
//    @IBAction func clearTapped(_ sender: UIButton) {
//        currentNumber = "0"
//        previousNumber = ""
//        currentOperation = ""
//        updateResultNumber()
//    }
//    
//    func updateResultNumber()  {
//        resultLabel.text = currentNumber
//    }
//    
//    func formattedNumber(_ number: Double) -> String {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        formatter.minimumFractionDigits = 0
//        formatter.maximumFractionDigits = 10
//        
//        if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
//            return formattedNumber
//        } else {
//            return "\(number)"
//        }
//        
//    }
//}
