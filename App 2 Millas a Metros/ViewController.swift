//
//  ViewController.swift
//  App 2 Millas a Metros
//
//  Created by Gustavo on 4/22/17.
//  Copyright © 2017 Gustavo. All rights reserved.
//

import UIKit


enum SelectedConversion: Int {
    case invalid = -1, toMiles = 0, toKilometers
    
    static func value(forKey key: Int) -> SelectedConversion {
        switch key {
        case 0:
            return .toMiles
        case 1:
            return .toKilometers
        default:
            return .invalid
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var distanceTextBox: UITextField!
    @IBOutlet var optionSelect: UISegmentedControl!
    @IBOutlet var resultLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool { return true } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        optionSelect.selectedSegmentIndex = 0
    }

    @IBAction func didTapConvert(_ sender: UIButton) {
        
        guard let value = Double(distanceTextBox.text!) else {
            alertHandler(error: .NaN)
            return
        }
        
        let targetUnit = SelectedConversion.value(forKey: optionSelect.selectedSegmentIndex)
        let conversion = convert(value, to: targetUnit)
        
        switch targetUnit {
        case .toMiles:
            let resultStr = String(format: "%.2f", conversion)
            resultLabel.text = "\(value) Kms\n = \n\(resultStr) Mi"
            break
        case .toKilometers:
            let resultStr = String(format: "%.2f", conversion)
            resultLabel.text = "\(value) Mi\n = \n\(resultStr) Kms"
            break
        default:
            break
        }
    }
    
    private func alertHandler(error: ErrorTypes){
        let alertBtn : UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alert: UIAlertController
        switch error {
        case .NaN:
            alert = UIAlertController(title: "Error", message: "Ingrese un número válido.", preferredStyle: .alert)
            alert.addAction(alertBtn)
            present(alert, animated: true, completion: nil)
        case .genericError:
            alert = UIAlertController(title: "Error", message: "Ups! algo ha salido mal vuelve a intentarlo", preferredStyle: .alert)
            alert.addAction(alertBtn)
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func convert(_ distance: Double, to: SelectedConversion) -> Double {
        switch to {
        case .toMiles:
            return distance * 0.621371
        case .toKilometers:
            return distance * 1.60934
        default:
            return -1.0
        }
    }
}

enum ErrorTypes: String {
    case NaN, genericError
}
