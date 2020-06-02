//
//  TippingModel.swift
//  Merces_SwiftUI
//
//  Created by Donovan McCray on 6/1/20.
//  Copyright © 2020 Donovan McCray. All rights reserved.
//

import Foundation

enum ServiceQuality {
    case Poor
    case Average
    case Great
}

class TippingModel: ObservableObject {
    
    @Published var subtotal: String
    @Published var taxAmount: String
    @Published var tip: String
    @Published var total: String
    @Published var totalPerPerson: String
    
    var partySize: String
    var venue: Venue
    var tipRate: String
    var service: ServiceQuality
    
    private var tipAmount: Double
    private var totalAmount: Double
    private var totalAmountPerPerson: Double
    
    init() {
        subtotal = "0.00"
        taxAmount = "0.00"
        
        partySize = "1"
        venue = venues[0]
        tipRate = "0.00"
        service = .Average
        
        tipAmount = 0.0; tip = "0.00"
        totalAmount = 0.0; total = "0.00"
        totalAmountPerPerson = 0.0; totalPerPerson = "0.00"
    }
    
    func resetValues() {
        subtotal = "0.00"
        taxAmount = "0.00"
        
        partySize = "1"
        venue = venues[0]
        tipRate = "0.00"
        service = .Average
        
        tipAmount = 0.0; tip = "0.00"
        totalAmount = 0.0; total = "0.00"
        totalAmountPerPerson = 0.0; totalPerPerson = "0.00"
    }
    
    func computeValues() {
        tipAmount = (mUserDefaults!.bool(forKey: "tipIncludeTaxSwitchOnOff") ? (subtotal.toDouble() + taxAmount.toDouble()) * tipRate.toDouble() : subtotal.toDouble() * tipRate.toDouble())
        
        totalAmount = subtotal.toDouble() + tipAmount + taxAmount.toDouble()
        
        totalAmountPerPerson = totalAmount / partySize.toDouble()
        
        if mUserDefaults!.bool(forKey: "roundTipAmountSwitchOnOff") {
            
            tipAmount = ceil(tipAmount)
            
            totalAmount = subtotal.toDouble() + tipAmount + taxAmount.toDouble()
            
            totalAmountPerPerson = totalAmount / Double(partySize.toDouble())
            
        }
        
        if mUserDefaults!.bool(forKey: "roundTotalAmountSwitchOnOff") {
            
            totalAmount = ceil(subtotal.toDouble() + tipAmount + taxAmount.toDouble())
            
            totalAmountPerPerson = ceil(totalAmount / partySize.toDouble())
            
        }
        
        self.tip = "\(tipAmount)"
        self.total = "\(totalAmount)"
        self.totalPerPerson = "\(totalAmountPerPerson)"
    }
}
