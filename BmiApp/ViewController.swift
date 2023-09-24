//
//  ViewController.swift
//  BmiApp
//
//  Created by Bruno Lopes on 2023-09-22.
//

import UIKit

class ViewController: UIViewController {
    /*
     Attributes/Properties
     static Functions
     Constructors/Init
     @override Functions
     Functions
     */
    
    @IBOutlet weak var txtHeightInCm: UITextField!
    
    
    @IBOutlet weak var txtWeightInKg: UITextField!
    
    
    @IBOutlet weak var lblResultBmi: UILabel!
    
    //static Functions
    
    func calculateBmi(weightInKg:Double, heightInCm:Double) ->Double{
        
        let heightInM = heightInCm/100
        
        let bmi = weightInKg/(heightInM*heightInM)
        
        return bmi
    }
    
    func myRound(number:Double) -> Double{
        
        let roundValue = round(number*10)/10.0
        
        return roundValue
    }
    
    
    func classification(bmiCalculated:Double) -> String {
        
        var classification: String
        
        switch bmiCalculated {
        case 0.0..<18.5:
            classification = "Underweight"
        case 18.5..<25.0:
            classification = "Normal weight"
        case 25.0..<30.0:
            classification = "Overweight"
        case 30.0...(100.0):
            classification = "Obesity"
        default:
            classification = "Invalid BMI"
        }
        
        return classification
    }
    
    
    
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {
        
        if let heightInCm = Double(txtHeightInCm.text!){
            
            if (heightInCm<80 || heightInCm>250){
                
                Toast.ok(view: self, title: "Review the height", message: "Enter a height between 80 cm and 250 cm.")
                
                return
                
            }else{
                
                if let weightInKg = Double(txtWeightInKg.text!){
                    
                    if (weightInKg<30 || weightInKg>300){
                        
                        Toast.ok(view: self, title: "Review the weight", message: "Enter a weight between 30 kg and 300 kg.")
                        
                        return
                        
                    }else{
                        
                        let bmiCalculated = calculateBmi(weightInKg: weightInKg, heightInCm: heightInCm)
                        
                        let bmiCorrected = myRound(number: bmiCalculated)
                        
                        let classification = classification(bmiCalculated: bmiCorrected)
                        
                        let backgroundColors: [String: UIColor] = [
                            "Underweight": .systemBlue,
                            "Normal weight": .systemGreen,
                            "Overweight": .systemYellow,
                            "Obesity": .systemOrange
                        ]
                        
                        lblResultBmi.text = classification
                        
                        lblResultBmi.backgroundColor = backgroundColors[classification]
                        
                        lblResultBmi.isHidden = false
                        
                    }
                }else{
                    
                    Toast.ok(view: self, title: "Review the weight", message: "Enter a valid weight.")
                    
                    return
                    
                }
            }
        }else{
            
            Toast.ok(view: self, title: "Review the height", message: "Enter a valid height.")
            
            return
            
        }
   
         
}
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            lblResultBmi.isHidden = true
        }
    
        
    @IBAction func txtHeightEditingChanged(_ sender: Any) {
        
        lblResultBmi.isHidden = true
    }
    
    @IBAction func txtWeightEditingChanged(_ sender: Any) {
        
        lblResultBmi.isHidden = true
    }
    
        
        
    }

