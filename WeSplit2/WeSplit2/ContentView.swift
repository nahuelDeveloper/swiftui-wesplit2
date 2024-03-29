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
    
    @FocusState private var amountIsFocused: Bool
        
    let tipPercentages = [10, 15, 20, 25, 0]
    
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let totalWithTip = checkAmount + (checkAmount * (Double(tipPercentage)/100.0))
        
        return totalWithTip / peopleCount
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }
                Section {
                        Text(totalPerPerson, format: .currency(code: currencyCode))
                    }
                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage:", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
