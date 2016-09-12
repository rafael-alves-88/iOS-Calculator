//
//  ViewController.swift
//  Calculator
//
//  Created by Usuário Convidado on 28/01/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calcOp:CalcOperation = CalcOperation()
    @IBOutlet weak var labelResult: UILabel!
    var arrayItens:[String] = [String]()
    
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonSub: UIButton!
    @IBOutlet weak var buttonMult: UIButton!
    @IBOutlet weak var buttonDiv: UIButton!
    @IBOutlet weak var buttonResult: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTap(sender: UIButton) {
        if (self.labelResult.text! == "0.0") {
            self.labelResult.text = ""
        }
        
        let labelText:String! = sender.titleLabel!.text!
        
        if(sender.titleLabel!.text == "CA") {
            self.labelResult.text = "0"
            clearCalc()
        } else {
            self.labelResult.text = self.labelResult.text! + labelText
        }
        
        self.arrayItens.append(labelText)
        
        if (labelText == "+" || labelText == "-" || labelText == "x" || labelText == "/") {
            disableOperators()
        } else {
            enableOperators()
        }
    }
    
    func disableOperators() {
        self.buttonAdd.enabled = false
        self.buttonSub.enabled = false
        self.buttonMult.enabled = false
        self.buttonDiv.enabled = false
        self.buttonResult.enabled = false
    }
    
    func enableOperators() {
        self.buttonAdd.enabled = true
        self.buttonSub.enabled = true
        self.buttonMult.enabled = true
        self.buttonDiv.enabled = true
        self.buttonResult.enabled = true
    }
    
    @IBAction func calcOperation(sender: UIButton) {
        let result: Double = self.calcOp.calculateWithArray(self.arrayItens)
        self.labelResult.text = "\(result)"
        
        clearCalc()
        self.arrayItens.append("\(result)")
    }
    
    func clearCalc() {
        self.arrayItens.removeAll()
    }
}

