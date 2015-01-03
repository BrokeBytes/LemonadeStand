//
//  SellLemonade.swift
//  LemonadeStand
//
//  Created by James Dykstra on 1/3/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import Foundation

class SellLemonade {
    class func dailyCustomers() -> Array<Double> {
            var customersArray:[Double] = []
            var numberOfCustomers = Int(arc4random_uniform(UInt32(9))) + 1
            
            for var i = 0; i <= numberOfCustomers; i++ {
                var myCustomer = Customer()
                customersArray.append(myCustomer.prefrence())
        }
        return customersArray
    }
    class func customerSales (lemonadeType:String, dailyCustomers:Array<Double>) -> Int {
        var customerArray = dailyCustomers
        var type = lemonadeType
        var acidicCustomer = 0
        var weakCustomer = 0
        var balancedCustomer = 0
        
        
        for var i=0 ; i < customerArray.count; i++  {
            if customerArray[i] < 0.40 {
                acidicCustomer++
            }
            else if customerArray[i] >= 0.40 && customerArray[i] <= 0.60 {
                balancedCustomer++
            }
            else if customerArray[i] > 0.60 {
                weakCustomer++
            }
        }
        
        switch type {
        case ("diluted"):
            return weakCustomer * 1
        case ("balanced"):
            return balancedCustomer * 1
        case ("acidic"):
            return acidicCustomer * 1
        default:
            return 0
        }
    }
    class func lemonadeType (lemons:Int, ice:Int) -> String {
        var ratio:Double = 0
        var type:String = ""
        if lemons > 0 && ice > 0 {
            ratio = Double(lemons / ice)
            println(ratio)
            
            if ratio < 1.0 {
                type = "diluted"
            }
            else if ratio == 1.0 {
                type = "balanced"
            }
            else if ratio > 1.0 {
                type = "acidic"
            }
        }
        else if lemons == 0 {
            //Alert
            type = "water"
        }
        else if ice == 0 {
            type = "lemon juice"
        }

        return type
    }
    
    
}