//
//  GCDView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

import SwiftUI
import Combine

struct GCDView: View {
    @State private var number1 = 0
    @State private var number2 = 0
    @State private var gcdResult = ""
    @State private var lcmResult = ""
    
    private var model = GCDModel()
    
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
                TextField("Number 1", value: $number1, formatter: formatter)
#if os(iOS)
                    .keyboardType(.numberPad)
#endif
                    .multilineTextAlignment(.trailing)
            
                TextField("Number 2", value: $number2, formatter: formatter)
#if os(iOS)
                    .keyboardType(.numberPad)
#endif
                    .multilineTextAlignment(.trailing)
            }

            Section {
                Button("Calculate") {
                    gcdResult = "\(model.calculateGCD(number1, number2))"
                    lcmResult = "\(model.calculateLCM(number1, number2))"
                }
//                .buttonStyle(.borderedProminent)
                .disabled(number1 == 0 && number2 == 0)
            }
            
            Section {
                LabeledContent("GCD", value: gcdResult)
                LabeledContent("LCM", value: lcmResult)
            } header: {
                Text("Results")
            }
        }
    }
}

#Preview {
    GCDView()
}
