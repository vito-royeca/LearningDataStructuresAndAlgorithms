//
//  GCDView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

import SwiftUI

struct GCDView: View {
    @State var number1 = 0
    @State var number2 = 0
    @State var gcdResult = ""
    @State var lcmResult = ""
    
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
            TextField("Number 1", value: $number1, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Number 2", value: $number2, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Calculate") {
                gcdResult = "\(calculateGCD(number1, number2))"
                lcmResult = "\(calculateLCM(number1, number2))"
            }
            Text("GCD: \(gcdResult)")
            Text("LCM: \(lcmResult)")
        }
    }

    // MARK: - Methods

    // Find GCD(a, b).
    // GCD(a, b) = GCD(b, a mod b).
    func calculateGCD(_ a: Int, _ b: Int) -> Int {
        var aCopy = Int(a)
        var bCopy = Int(b)
        
        repeat {
            // Calculate the remainder.
            let remainder = aCopy % bCopy
            
            // Calculate GCD(b, remainder).
            aCopy = bCopy
            bCopy = remainder
            
        } while bCopy != 0
        
        return aCopy
    }
    
    // Find GCD(a, b) recursively.
    // GCD(a, b) = GCD(b, a mod b).
    func calculateRecursiveGcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return calculateRecursiveGcd(b, a % b)
    }
    
    func calculateLCM(_ a: Int, _ b: Int) -> Int {
        (a / calculateGCD(a, b)) * b
    }
}

#Preview {
    GCDView()
}
