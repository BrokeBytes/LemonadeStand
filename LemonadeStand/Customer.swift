//
//  Customer.swift
//  LemonadeStand
//
//  Created by James Dykstra on 1/3/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import Foundation

struct Customer {
    
    func prefrence () -> Double {
        var mylemonadePreference = Double(arc4random_uniform(UInt32(99)))
        return (mylemonadePreference + 1) / 100
        
    }
}
