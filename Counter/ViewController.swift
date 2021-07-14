//
//  ViewController.swift
//  Counter
//
//  Created by Saba Khitaridze on 10.07.21.
//


import UIKit


class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var biggestNumberLabel: UILabel!
    @IBOutlet weak var numberDivisorsLabel: UILabel!
    @IBOutlet weak var numberTypeLabel: UILabel!
    @IBOutlet weak var numberOne: UILabel!
    @IBOutlet weak var numberTwo: UILabel!
    @IBOutlet weak var numberThree: UILabel!
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    
    var number1 = 1
    var number2 = 1
    var number3 = 1
    var sliderValue = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExternalData()
        removeValues()
    }
    
    //MARK: - External Functions
    
    func loadExternalData() {
        calculateButton.layer.cornerRadius = 25
        generatorButton.layer.cornerRadius = 25
        rangeSlider.value = 25
    }
    
    func removeValues() {
        sliderValueLabel.text = ""
        numberOne.text = "0"
        numberTwo.text = "0"
        numberThree.text = "0"
        biggestNumberLabel.text = ""
        numberDivisorsLabel.text = ""
        numberTypeLabel.text = ""
    }
    
    func removeAnswers(isHidden: Bool) {
        if isHidden == true {
            biggestNumberLabel.isHidden = true
            numberDivisorsLabel.isHidden = true
            numberTypeLabel.isHidden = true
        } else if isHidden == false {
            biggestNumberLabel.isHidden = false
            numberDivisorsLabel.isHidden = false
            numberTypeLabel.isHidden = false
        }
    }
    
    
    func numberDivisors(number: Int) -> String {
        var divisor: String = ""
        
        for index in 1...number {
            if number % index == 0 {
                divisor += index == 1 ? "1" : " , \(index)"
            }
        }
        return divisor
    }
    
    
    func numberType(number: Int) -> String {
        var num = 0
        for i in 1...number {
            if number % i == 0 {
                num += 1
            }
        }
        if num == 2 {
            return ("prime number")
        } else {
            return ("composite number")
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func getRangeNumbers(_ sender: UISlider) {
        
        sliderValue = Int(sender.value)
        sliderValueLabel.text = "\(Int(sliderValue))"
    }
    
    
    @IBAction func generatorButtonPressed(_ sender: UIButton) {
        removeAnswers(isHidden: true)
        
        //this if statement prevents app from crashing
        if sliderValue > 2 {
            //number one value
            number1 = Int.random(in: Int(rangeSlider.minimumValue)..<sliderValue)
            numberOne.text = String(number1)
            
            //number two value
            number2 = Int.random(in: Int(rangeSlider.minimumValue)..<sliderValue)
            numberTwo.text = String(number2)
            
            //number three value
            number3 = Int.random(in: Int(rangeSlider.minimumValue)..<sliderValue)
            numberThree.text = String(number3)
        } else {
            biggestNumberLabel.text = ""
            biggestNumberLabel.isHidden = false
            biggestNumberLabel.text = "Max number is not enough"
            numberOne.text = "0"
            numberTwo.text = "0"
            numberThree.text = "0"
        }
    }
    
    
    @IBAction func CalculateButtonPressed(_ sender: UIButton) {
        removeAnswers(isHidden: false)
        if number1 > number2 && number1 > number3 {
            biggestNumberLabel.text = "The biggest number is \(number1)"
            numberDivisorsLabel.text = "divisors of \(number1) are:  \(numberDivisors(number: number1))"
            numberTypeLabel.text = "\(number1) is a \(numberType(number: number1))"
        } else if number2 > number1 && number2 > number3 {
            biggestNumberLabel.text = "The biggest number is \(number2)"
            numberDivisorsLabel.text = "divisors of \(number2) are:  \(numberDivisors(number: number2))"
            numberTypeLabel.text = "\(number2) is a \(numberType(number: number2))"
        } else if number3 > number1 && number3 > number2 {
            biggestNumberLabel.text = "The biggest number is \(number3)"
            numberDivisorsLabel.text = "divisors of \(number3) are:  \(numberDivisors(number: number3))"
            numberTypeLabel.text = "\(number3) is a \(numberType(number: number3))"
        } else {
            biggestNumberLabel.text = ("Two of them are same, try again")
            numberDivisorsLabel.isHidden = true
            numberTypeLabel.isHidden = true
        }
    }
}
