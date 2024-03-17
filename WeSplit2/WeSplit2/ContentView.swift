//
//  ContentView.swift
//  WeSplit2
//
//  Created by Nahuel Jose Roldan on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
        
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                .keyboardType(.decimalPad)
            }
            Section {
                    Text(checkAmount, format: .currency(code: currencyCode))
                }
        }
    }
}

#Preview {
    ContentView()
}
