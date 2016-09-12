//
//  CalcOperation.swift
//  Calculator
//
//  Created by Usuário Convidado on 28/01/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class CalcOperation: NSObject {
    
    func calculateWithArray(anArr:[String]) -> Double {
        var num1:Double!
        var num2:Double!
        var math:String!
        var result:Double! = 0.0
        
        for item:String in anArr {
            switch item {
            case Math.add.rawValue, Math.sub.rawValue, Math.mult.rawValue, Math.div.rawValue:
                math = item
            default:
                if (num1 == nil) {
                    num1 = Double(item)
                } else {
                    num2 = Double(item)
                    
                    switch math {
                    case Math.add.rawValue:
                        result = add(num1!, num2:num2!)
                    case Math.sub.rawValue:
                        result = sub(num1!, num2:num2!)
                    case Math.mult.rawValue:
                        result = mult(num1!, num2:num2!)
                    case Math.div.rawValue:
                        result = div(num1!, num2:num2!)
                    default:
                        break
                    }
                    
                    num1 = result
                }
            }
        }
        
        return result!
    }
    
    enum Math:String {
        case add = "+"
        case sub = "-"
        case mult = "x"
        case div = "/"
    }
    
    func add(num1:Double, num2:Double) -> Double {
        return num1 + num2
    }
    
    func sub(num1:Double, num2:Double) -> Double {
        return num1 - num2
    }
    
    func mult(num1:Double, num2:Double) -> Double {
        return num1 * num2
    }
    
    func div(num1:Double, num2:Double) -> Double {
        return num1 / num2
    }
}
