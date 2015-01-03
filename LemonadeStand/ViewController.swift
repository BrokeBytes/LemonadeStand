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
    
    var playerCash = 0
    var playerLemons = 0
    var playerIce = 0
    let lemonCost = 2
    let iceCost = 1
    var lemonsBought = 0
    var iceBought = 0
    var lemonsInMix = 0
    var iceInMix = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBActions for Buttons
    
    //Buy Lemon Button
    @IBAction func lemonBuyButtonPressed(sender: AnyObject) {
        println("Buy Lemon")
        buyLemon()
    }
    
    //Refund Lemon Button
    @IBAction func lemonRefundButtonPressed(sender: AnyObject) {
        println("Refund Lemon")
        refundLemon()
    }
    
    //Buy Ice Button
    @IBAction func iceBuyButtonPressed(sender: AnyObject) {
        println("Buy Ice")
        buyIce()
    }
    
    //Refund Ice Button
    @IBAction func iceRefundButtonPressed(sender: AnyObject) {
        println("Refund Ice")
        refundIce()
    }
    
    //Add Lemon to Mix Button
    @IBAction func addLemonMixButtonPressed(sender: AnyObject) {
        self.mixLemonade("lemon", quanitiy: 1)
        println("Lemon Added")
    }
    
    //Remove Lemon from Mix Button
    @IBAction func removeLemonMixButtonPressed(sender: AnyObject) {
        self.mixLemonade("lemon", quanitiy: -1)
        println("Lemon Removed")
    }
    
    //Add Ice to Mix button
    @IBAction func addIceMixButtonPressed(sender: AnyObject) {
        self.mixLemonade("ice", quanitiy: 1)
        println("Add Ice")
    }

    //Remove Ice button Pressed
    @IBAction func removeIceMixButtonPressed(sender: AnyObject) {
        self.mixLemonade("ice", quanitiy: -1)
        println("Remove Ice")
    }
    //Start the Day
    @IBAction func startButtonPressed(sender: AnyObject) {
        println("Start Day")
        sellDay()
        
    }

    //Reset Game
    func resetGame () {
        self.playerCash = 10
        self.playerLemons = 1
        self.playerIce = 3
    }
    
    //Buy Lemons
    func buyLemon () {
        if self.playerCash >= 2 {
            self.playerCash -= self.lemonCost
            self.playerLemons += 1
            self.lemonsBought += 1
        }
        else {
            //alert
            println("Not enough Cash to Buy Lemons")
        }
        
        self.cashTotalLabel.text = "$\(self.playerCash)"
        
        if playerLemons > 1 {
           self.lemonInventoryLabel.text = "\(self.playerLemons) Lemons"
        }
        else if playerLemons == 1 {
           self.lemonInventoryLabel.text = "\(self.playerLemons) Lemon"
        }
        else {
            self.lemonInventoryLabel.text = "No Lemons"
        }
        
        self.lemonPurchasedLabel.text = "\(self.lemonsBought)"
    }
    func refundLemon () {
        if self.lemonsBought > 0 {
            self.lemonsBought -= 1
            self.playerCash += self.lemonCost
            self.playerLemons -= 1
        }
        else {
            //alert
            println("no lemons left to refund")
        }
        self.cashTotalLabel.text = "$\(self.playerCash)"
        
        if playerLemons > 1 {
            self.lemonInventoryLabel.text = "\(self.playerLemons) Lemons"
        }
        else if playerLemons == 1 {
            self.lemonInventoryLabel.text = "\(self.playerLemons) Lemon"
        }
        else {
            self.lemonInventoryLabel.text = "No Lemons"
        }
        
        self.lemonPurchasedLabel.text = "\(self.lemonsBought)"
    }
    
    func buyIce () {
        if self.playerCash >= 1 {
            self.playerCash -= self.iceCost
            self.playerIce += 1
            self.iceBought += 1
        }
        else {
            //alert
            println("Not Enough Cash to Buy Ice")
        }
        self.cashTotalLabel.text = "$\(self.playerCash)"
        self.iceInventoryLabel.text = "\(self.playerIce) Ice"
        self.icePurchasedLabel.text = "\(self.iceBought)"
    }
    
    func refundIce () {
        if iceBought > 0 {
            self.iceBought -= 1
            self.playerIce -= 1
            self.playerCash += self.iceCost
        }
        else {
            //alert
            println("No Ice to Refund")
        }
        self.cashTotalLabel.text = "$\(self.playerCash)"
        self.iceInventoryLabel.text = "\(self.playerIce) Ice"
        self.icePurchasedLabel.text = "\(self.iceBought)"
    }
    
    func mixLemonade (ingredient: String, quanitiy: Int) {
        var whichIngredientTuple = (ingredient, quanitiy)
        switch whichIngredientTuple {
            case ("ice", 1):
                if self.playerIce > 0 {
                self.iceInMix += 1
                self.playerIce -= 1
                }
                else {
                    //alert
                    println("No Ice in Inventory")
                }
        case ("ice", -1):
            if self.iceInMix > 0 {
                self.iceInMix -= 1
                self.playerIce += 1
            }
            else {
                println("No Ice in Mix")
            }
        case ("lemon", 1):
            if self.playerLemons > 0 {
                self.playerLemons -= 1
                self.lemonsInMix += 1
            }
            else {
                //alert
                println("No Lemons in Inventory")
            }
        case ("lemon", -1):
            if self.lemonsInMix > 0 {
                self.lemonsInMix -= 1
                self.playerLemons += 1
            }
            else {
                //alert
                println("No Lemons in Mix")
            }
        default:
            println("default")
            } //switch
        
        self.iceInventoryLabel.text = "\(self.playerIce) Ice"
        self.iceMixLabel.text = "\(self.iceInMix)"
        self.lemonInventoryLabel.text = "\(self.playerLemons) Lemons"
        self.lemonMixLabel.text = "\(self.lemonsInMix)"
        
    }//func
    
    func buyIngredients (ingredient: String, quanitiy: Int) {
        
    }
    func sellDay () {
        var myCustomer = SellLemonade.dailyCustomers()
        println("Daily Customer \(myCustomer.count)")
        var myLemonade = SellLemonade.lemonadeType(self.lemonsInMix, ice: self.iceInMix)
        println("My Lemonade Type is " + myLemonade)
        var myDailySales = SellLemonade.customerSales(myLemonade, dailyCustomers: myCustomer)
        println("My Daily Sales where $ \(myDailySales).00")
        self.lemonsInMix = 0
        self.iceInMix = 0
        self.iceBought = 0
        self.lemonsBought = 0
        
        playerCash += myDailySales
        
        self.cashTotalLabel.text = "$\(self.playerCash)"
        self.iceMixLabel.text = "\(self.iceInMix)"
        self.lemonMixLabel.text = "\(self.lemonsInMix)"
        self.lemonPurchasedLabel.text = "\(self.lemonsBought)"
        }


}

