//
//  NumericalIntegrationModel.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import Foundation

struct NumericalIntegrationResults {
    var estimatedArea = 0.0
    var trueArea = 0.0
    var errorPercentage = 0.0
    
    var estimatedAreaString: String {
        get {
            String(format: "%.6f", estimatedArea)
        }
    }
    var trueAreaString: String {
        get {
            String(format: "%.6f", trueArea)
        }
    }
    
    var errorPercentageString: String {
        get {
            "\(String(format: "%.3f", errorPercentage))%"
        }
    }
    
    static func == (lhs: NumericalIntegrationResults, rhs: NumericalIntegrationResults) -> Bool {
        lhs.estimatedArea.round(to: 6) == rhs.estimatedArea.round(to: 6)
        && lhs.trueArea.round(to: 6) == rhs.trueArea.round(to: 6)
        && lhs.errorPercentage.round(to: 3) == rhs.errorPercentage.round(to: 3)
    }
}

class NumericalIntegrationModel {
    func integrand(_ x: Double) -> Double {
        1.0  + x + sin(2 * x)
    }
    
    func antiDerivative(x: Double) -> Double {
        x + x * x / 2.0 - cos(2.0 * x) / 2.0
    }
    
    func getBounds(minX: Double, maxX: Double) -> (minY: Double, maxY: Double) {
        var minY = integrand(minX)
        var maxY = minY
        
        for x in stride(from: minX, through: maxX, by: 0.1) {
            let y = integrand(x)
            if y < minY {
                minY = y
            }
            if y > maxY {
                maxY = y
            }
        }
        
        let dy = maxY - minY
        minY -= dy * 0.05
        maxY += dy * 0.05
        
        return (minY: minY, maxY: maxY)
    }
    
    func calculateRectangleIntegration(minX: Double, maxX: Double, intervals: Int) -> NumericalIntegrationResults {
        let (minY, maxY) = getBounds(minX: minX, maxX: maxX)
        let estimatedArea = integrateRectangle(minX: minX, maxX: maxX, minY: minY, maxY: maxY, intervals: intervals)
        let trueArea = antiDerivative(x: maxX) - antiDerivative(x: minX)
        let errorPercentage = 100 * (estimatedArea - trueArea) / trueArea
        
        return NumericalIntegrationResults(estimatedArea: estimatedArea, trueArea: trueArea, errorPercentage: errorPercentage)
    }
    
    func calculateTrapezoidIntegration(minX: Double, maxX: Double, intervals: Int) -> NumericalIntegrationResults {
        let (minY, maxY) = getBounds(minX: minX, maxX: maxX)
        let estimatedArea = integrateTrapezoid(minX: minX, maxX: maxX, minY: minY, maxY: maxY, intervals: intervals)
        let trueArea = antiDerivative(x: maxX) - antiDerivative(x: minX)
        let errorPercentage = 100 * (estimatedArea - trueArea) / trueArea
        
        return NumericalIntegrationResults(estimatedArea: estimatedArea, trueArea: trueArea, errorPercentage: errorPercentage)
    }
    
    func integrateRectangle(minX: Double, maxX: Double, minY: Double, maxY: Double, intervals: Int) -> Double {
        let dX = (maxX - minX) / Double(intervals)
        var total: Double = 0
        
        var x: Double = minX
        for _ in 0..<intervals {
            // Add the area in the rectangle for this slice.
            total += integrand(x)
            
            // Move to the next slice.
            x += dX
        }
        total *= dX

        return total
    }
    
    func integrateTrapezoid(minX: Double, maxX: Double, minY: Double, maxY: Double, intervals: Int) -> Double {
        let dX = (maxX - minX) / Double(intervals)
        var total: Double = 0
        
        var x: Double = minX
        for _ in 0...intervals {
            // Add the area in the rectangle for this slice.
            total += integrand(x)
            
            // Move to the next slice.
            x += dX
        }

        // Double and subtract the first and last values.
        total = total * 2 - integrand(minX) - integrand(maxX)
        total *= dX / 2

        return total
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
