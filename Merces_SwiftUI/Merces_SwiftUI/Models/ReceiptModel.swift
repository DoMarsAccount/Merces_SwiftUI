//
//  ReceiptModel.swift
//  Merces_SwiftUI
//
//  Created by Donovan McCray on 6/1/20.
//  Copyright © 2020 Donovan McCray. All rights reserved.
//

import Foundation

class ReceiptModel {
    var billAmount: Double
    var taxAmount: Double
    
    var partySize: Int
    var venue: Venue
    var tipRate: Double
    
    init(billAmt: Double, taxAmt: Double, numPeople: Int, venue: Venue, tip: Double) {
        self.billAmount = billAmt
        self.taxAmount = taxAmt
        self.partySize = numPeople
        self.venue = venue
        self.tipRate = tip
    }
}
