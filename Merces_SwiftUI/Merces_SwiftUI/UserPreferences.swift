//
//  UserPreferences.swift
//  Merces_SwiftUI
//
//  Created by Donovan McCray on 6/1/20.
//  Copyright © 2020 Donovan McCray. All rights reserved.
//

import SwiftUI

class UserPreferences: ObservableObject {
    var tipIncludeTax: Bool
    var roundTipAmount: Bool
    var roundTotalAmount: Bool
    var subtotalIsPostTax: Bool
    var useDynamicText: Bool
    
    init() {
        tipIncludeTax = mUserDefaults!.bool(forKey: "tipIncludeTaxSwitchOnOff")
        roundTipAmount = mUserDefaults!.bool(forKey: "roundTipAmountSwitchOnOff")
        roundTotalAmount = mUserDefaults!.bool(forKey: "roundTotalAmountSwitchOnOff")
        subtotalIsPostTax = mUserDefaults!.bool(forKey: "subtotalIsPostTaxSwitchOnOff")
        useDynamicText = mUserDefaults!.bool(forKey: "useDynamicText")
    }
}
