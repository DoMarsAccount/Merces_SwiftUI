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
    var billAmount: Double
    var taxAmount: Double
    
    var partySize: Int
    var venue: Venue
    var tipRate: Double
    var service: ServiceQuality
    
    init() {
        billAmount = 0.0
        taxAmount = 0.0
        
        partySize = 1
        venue = venues[0]
        tipRate = 0.0
        service = .Average
    }
    
    func resetValues() {
        billAmount = 0.0
        taxAmount = 0.0
        
        partySize = 1
        venue = venues[0]
        tipRate = 0.0
        service = .Average
    }
}
