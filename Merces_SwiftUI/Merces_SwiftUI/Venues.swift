//
//  Venues.swift
//  Merces_SwiftUI
//
//  Created by Donovan McCray on 6/1/20.
//  Copyright © 2020 Donovan McCray. All rights reserved.
//

import Foundation

let mUserDefaults = (UserDefaults(suiteName: "group.DoMarsToyBox.Merces"))

struct Venue {
    var name: String
    var tipRates: [Double]
}

var venues: [Venue] = [
    Venue(name: "Quick", tipRates: mUserDefaults?.array(forKey: "quickTipArray") as! [Double]),
    Venue(name: "Bar", tipRates: mUserDefaults?.array(forKey: "barTipArray") as! [Double]),
    Venue(name: "Dining", tipRates: mUserDefaults?.array(forKey: "diningTipArray") as! [Double]),
    Venue(name: "Salon", tipRates: mUserDefaults?.array(forKey: "salonTipArray") as! [Double]),
    Venue(name: "Taxi", tipRates: mUserDefaults?.array(forKey: "taxiTipArray") as! [Double]),
    Venue(name: "Delivery", tipRates: mUserDefaults?.array(forKey: "deliveryTipArray") as! [Double])
]

var selectedVenue = "Quick"

