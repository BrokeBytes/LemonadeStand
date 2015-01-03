//
//  ViewController.swift
//  LemonadeStand
//
//  Created by James Dykstra on 1/3/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cashTotalLabel: UILabel!
    @IBOutlet weak var lemonInventoryLabel: UILabel!
    @IBOutlet weak var iceInventoryLabel: UILabel!
    @IBOutlet weak var lemonPurchasedLabel: UILabel!
    @IBOutlet weak var icePurchasedLabel: UILabel!
    @IBOutlet weak var lemonMixLabel: UILabel!
    @IBOutlet weak var iceMixLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBActions for Buttons
    
    //Buy Lemon Button
    @IBAction func lemonBuyButtonPressed(sender: AnyObject) {
        println("Buy Lemon")
    }
    
    //Refund Lemon Button
    @IBAction func lemonRefundButtonPressed(sender: AnyObject) {
        println("Refund Lemon")
    }
    
    //Buy Ice Button
    @IBAction func iceBuyButtonPressed(sender: AnyObject) {
        println("Buy Ice")
    }
    
    //Refund Ice Button
    @IBAction func iceRefundButtonPressed(sender: AnyObject) {
        println("Refund Ice")
    }
    
    //Add Lemon to Mix Button
    @IBAction func addLemonMixButtonPressed(sender: AnyObject) {
        println("Lemon Added")
    }
    
    //Remove Lemon from Mix Button
    @IBAction func removeLemonMixButtonPressed(sender: AnyObject) {
        println("Lemon Removed")
    }
    
    //Add Ice to Mix button
    @IBAction func addIceMixButtonPressed(sender: AnyObject) {
        println("Add Ice")
    }

    //Remove Ice button Pressed
    @IBAction func removeIceMixButtonPressed(sender: AnyObject) {
        println("Remove Ice")
    }

    @IBAction func startButtonPressed(sender: AnyObject) {
        println("Start Day")
    }

}

