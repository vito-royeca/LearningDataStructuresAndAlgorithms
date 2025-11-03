//
//  GCDModel.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

class GCDModel {
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
    func calculateRecursiveGCD(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return calculateRecursiveGCD(b, a % b)
    }
    
    func calculateLCM(_ a: Int, _ b: Int) -> Int {
        (a / calculateGCD(a, b)) * b
    }
}
