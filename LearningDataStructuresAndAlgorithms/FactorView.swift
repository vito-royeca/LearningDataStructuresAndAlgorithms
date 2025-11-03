//
//  FactorView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

import SwiftUI

struct FactorView: View {
    @State private var number = 0
    @State private var result = ""
    
    private var model = FactorModel()
    
    // Create a NumberFormatter for integer input
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none // Or .decimal for general numbers
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }()

    var body: some View {
        Form {
            Section {
                TextField("Number", value: $number, formatter: formatter)
#if os(iOS)
                    .keyboardType(.numberPad)
#endif
                    .multilineTextAlignment(.trailing)
            }

            Section {
                Button("Calculate") {
                    result = "\(model.toString(model.calculateFactor(number)))"
                }
                .disabled(number == 0)
            }
            
            Section {
                LabeledContent("Factors", value: result)
            } header: {
                Text("Result")
            }
        }
    }
}

#Preview {
    FactorView()
}
