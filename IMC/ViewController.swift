//
//  ViewController.swift
//  IMC
//
//  Created by Intacta Engenharia on 22/12/20.
//  Copyright © 2020 Emerson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            imc = weight / pow(height, 2)
            showResults()
        }
        
    }
    
    func showResults(){
        var results: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                results = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                results = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25.5:
                results = "Peso ideal"
                image = "ideal"
            case 25..<30:
                results = "Sobrepeso"
                image = "sobre"
            default:
                results = "Peso ideal"
                image = "ideal"
        }
        lbResult.text = "\(Int(imc)): \(results)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    

    

}

