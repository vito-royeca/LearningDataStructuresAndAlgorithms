//
//  NumericalIntegrationView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import SwiftUI
import Charts

struct PointData: Identifiable {
    let id: Int
    let x: Double
    let y: Double
}

struct NumericalIntegrationView: View {
    @State private var minX = Double(0)
    @State private var maxX = Double(5)
    @State private var intervals = 10
    @State private var rectangleResult = NumericalIntegrationResults()
    @State private var trapezoidResult = NumericalIntegrationResults()
    
    private var model = NumericalIntegrationModel()

    var body: some View {
        Form {
            Chart(generateData(), id: \.id) { point in
                LineMark(
                    x: .value("X", point.x),
                    y: .value("Y", point.y)
                )
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()

            Stepper("Min X: \(Int(minX))", value: $minX, in: 0...19, step: 1)
            Stepper("Max X: \(Int(maxX))", value: $maxX, in: 1...20, step: 1)
            Stepper("Intervals: \(intervals)", value: $intervals, in: 1...10, step: 1)
            
            Section {
                Button("Integrate") {
                    rectangleResult = model.calculateRectangleIntegration(minX: minX, maxX: maxX, intervals: intervals)
                    trapezoidResult = model.calculateTrapezoidIntegration(minX: minX, maxX: maxX, intervals: intervals)
                }
                .disabled(minX == 0 && maxX == 0 && intervals == 0)
            }
            
            Section {
                LabeledContent("Estimated Area", value: rectangleResult.estimatedAreaString)
                LabeledContent("True Area", value: rectangleResult.trueAreaString)
                LabeledContent("% Error", value: rectangleResult.errorPercentageString)
            } header: {
                Text("Triangle Rule Results")
            }
            
            Section {
                LabeledContent("Estimated Area", value: trapezoidResult.estimatedAreaString)
                LabeledContent("True Area", value: trapezoidResult.trueAreaString)
                LabeledContent("% Error", value: trapezoidResult.errorPercentageString)
            } header: {
                Text("Trapezoid Rule Results")
            }
        }
    }
    
    func generateData() -> [PointData] {
        var data: [PointData] = []
        for i in 0..<intervals {
            let x = Double(i)
            let y = integrand(x)
            
            data.append(PointData(id: i, x: x, y: y))
        }
        return data
    }
    
    func integrand(_ x: Double) -> Double {
        return 1.0  + x + sin(2 * x)
    }
}

#Preview {
    NumericalIntegrationView()
}
