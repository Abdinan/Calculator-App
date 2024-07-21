//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Abdullah INAN on 26/06/2024.
//

import UIKit

class ViewController: UIViewController {
    // MARK: @IBOutlet Variables
    @IBOutlet weak var resultLabel: UILabel!  // Label on the result screen
    @IBOutlet var buttons: [UIButton]!        // All buttons on th screen
    
    // MARK: VARIABLES
    var currentNumber = "0"  // Default numbers for first and second position of numbers and calculation operators
    var previousNumber = ""
    var currentOperation = ""
    
    override func viewDidLoad() {  // viewDidLoad screen
        super.viewDidLoad()
        updateResultLabel()
        roundButton()
    }
    func roundButton () { // The function to make all buttons round.
        for button in buttons {
            button.layer.cornerRadius = button.bounds.size.height / 2
            button.clipsToBounds = true
        }
    }
    
    // MARK: @IBAction Buttons
    @IBAction func digitTapped(_ sender: UIButton) {  // Actions when tapped the digits
        guard let digit = sender.currentTitle else { return }
        if currentNumber == "0" {
            currentNumber = digit
        } else { currentNumber  += digit}
        resultLabel.text = currentNumber
        // DEBUGGING on Consol:print("Digit tapped: \(digit), currentNumber: \(currentNumber)") updateResultLabel()
    }
    @IBAction func operationTapped(_ sender: UIButton) { // Actions when tapped the operations
        guard let operation = sender.currentTitle else { return }
        previousNumber = currentNumber
        currentNumber = "0"
        currentOperation = operation
        // DEBUGGING on Consol:print("Operation tapped: \(operation), previousNumber: \(previousNumber), currentOperation: \(currentOperation)")
    }
    @IBAction func equalsTapped(_ sender: UIButton) { // Action for Equal tapped
        guard let previous = Double(previousNumber),
              let current = Double(currentNumber) else { return }
        var result: Double = 0
        switch currentOperation {
        case "+":
            result = previous + current
        case "-":
            result = previous - current
        case "x":
            result = previous * current
        case "/":
            if current != 0 { // condition to avoid divide by "0"
                result = previous / current
            } else { resultLabel.text = "Error"
                return
            }
        default:
            return
        }
        currentNumber = formatNumber(result)
        updateResultLabel()
        // DEBUGGING on Consol: print("Equals tapped: result = \(result), currentNumber: \(currentNumber)") updateResultLabel()
    }
    @IBAction func clearTapped(_ sender: UIButton) { // Action for clear the calculations and label
        currentNumber = "0"
        previousNumber = ""
        currentOperation = ""
        updateResultLabel()
        // DEBUGGING on Consol: print("Clear tapped")
    }
    
    // MARK: PRIVATE's Functions
    private func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        
        if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
            return formattedNumber
        } else {
            return "\(number)"
        }
    }
    private func updateResultLabel() {
        resultLabel.text = currentNumber
    }
}
