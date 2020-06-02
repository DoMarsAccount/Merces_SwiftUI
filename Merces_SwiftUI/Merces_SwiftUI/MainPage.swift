//
//  MainPage.swift
//  Merces_SwiftUI
//
//  Created by Donovan McCray on 6/1/20.
//  Copyright © 2020 Donovan McCray. All rights reserved.
//

import SwiftUI

struct MainPage: View {
    @State private var subtotal: String = "$0.00"
    @State private var salesTax: String = "$0.00"
    @State private var numPeople: String = "1"
    
    @ObservedObject var tipper: TippingModel = TippingModel()
    
    var body: some View {
        VStack {
            
            InputField(text: "Subtotal", value: self.$tipper.subtotal)
            
            HStack {
                InputField(text: "Sales Tax", value: self.$tipper.taxAmount)
                InputField(text: "# of people", value: self.$tipper.partySize)
            }
            
            
            
            InputField(text: "Tip Amount", value: self.$tipper.tip)
            InputField(text: "Total Amount", value: self.$tipper.total)
            InputField(text: "Total Per Person", value: self.$tipper.totalPerPerson)
        }.onTapGesture {
            self.tipper.computeValues()
            UIApplication.shared.windows.forEach { $0.endEditing(true) }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

struct InputField: View {
    let text: String
    var value: Binding<String>
    
    var body: some View {
        VStack(alignment: .center) {
            Text(self.text)
                .foregroundColor(.green)
                .fontWeight(.medium)
                .font(.system(size: 24))
            
            TextField(self.text, text: self.value, onEditingChanged: { (changed) in
                
            }) {
                
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .font(.system(size: 24))
        }.padding()
    }
}

struct TrackRowButton: ViewModifier {
    var condition: Bool
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(self.condition ? Color.blue : .secondary)
            .cornerRadius(20)
            .foregroundColor(self.condition ? .white : .primary)
    }
}
