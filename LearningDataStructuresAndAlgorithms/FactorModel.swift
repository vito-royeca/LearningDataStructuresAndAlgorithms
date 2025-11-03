//
//  FactorModel.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

import Foundation

class FactorModel {
    func calculateFactor(_ number: Int) -> [Int] {
        var factors = [Int]()
        var numberCopy = Int(number)
        
        // Pull out factors of 2.
        repeat {
            factors.append(2)
            numberCopy /= 2
        } while numberCopy % 2 == 0
        
        // Look for other factors.
        var factor = 3
        var stopAt = Int(sqrt(Double(numberCopy)))
        while factor <= stopAt {
            // See if factor divides evenly into number.
            while numberCopy % factor == 0 {
                // Pull out this factor.
                factors.append(factor)
                numberCopy /= factor
                
                // Calculate a new stopAt value.
                stopAt = Int(sqrt(Double(numberCopy)))
            }
            
            // Go to the next possible factor.
            factor += 2
        }
        
        // Add whatever is left over to the factors.
        if numberCopy > 1 {
            factors.append(numberCopy)
        }
        
        return factors
    }
    
    func toString(_ factors: [Int]) -> String {
        return factors.map(\.description).joined(separator: "x")
    }
}
