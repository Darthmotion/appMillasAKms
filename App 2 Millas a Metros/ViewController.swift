//
//  ViewController.swift
//  App 2 Millas a Metros
//
//  Created by Gustavo on 4/22/17.
//  Copyright © 2017 Gustavo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var distanceTextBox: UITextField!
    
    @IBOutlet var optionSelect: UISegmentedControl!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertPressed(_ sender: UIButton) {
        
        let selectedIndex = optionSelect.selectedSegmentIndex
        
        if distanceTextBox.text == "" {
            
            let error = 0
            alertHandler(error: error)
            
        }else if Double(distanceTextBox.text!) == nil {
            
            let error = 1
            alertHandler(error: error)
            

        } else {
            
            let distance = Double(distanceTextBox.text!)!
         
            if selectedIndex == 0 {
                
                let result = distance * 0.621371
                convertFunc(distance: distance, result: result)
                
                
            }else if selectedIndex == 1{
                
                let result = distance * 1.60934
                convertFunc(distance: distance, result: result)
                
            }else{
                
                let error = 2
                alertHandler(error: error)
            }
        }
        
    }

    func convertFunc (distance : Double, result : Double){
        
        let initValue = String(format: "%.2f", distance)
        let endValue = String(format: "%.2f", result)
        
        if optionSelect.selectedSegmentIndex == 0 {
            resultLabel.text = "\(initValue) Kms = \(endValue) Millas"
        } else if optionSelect.selectedSegmentIndex == 1 {
            resultLabel.text = "\(initValue) Millas = \(endValue) Kilometros"
        }
    }
    
    func alertHandler(error: Int){
        
        switch error {
        
        case 0:
            let alert : UIAlertController = UIAlertController(title: "Error", message: "No introdujiste nada a Convertir", preferredStyle: .alert)
            
            let alertBtn : UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(alertBtn)
            
            present(alert, animated: true, completion: nil)
            
        case 1:
            let alert : UIAlertController = UIAlertController(title: "Error", message: "No introdujiste un numero valido", preferredStyle: .alert)
            
            let alertBtn : UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(alertBtn)
            
            present(alert, animated: true, completion: nil)
        case 2:
            let alert : UIAlertController = UIAlertController(title: "Error", message: "Ups! algo ha salido mal vuelve a intentarlo", preferredStyle: .alert)
            
            let alertBtn : UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(alertBtn)
            
            present(alert, animated: true, completion: nil)
        default: break
            
        }
    }
    
}
