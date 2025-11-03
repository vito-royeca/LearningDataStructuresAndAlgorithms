//
//  LearningDataStructuresAndAlgorithmsTests.swift
//  LearningDataStructuresAndAlgorithmsTests
//
//  Created by Vito Royeca on 10/30/25.
//

import Testing

struct LearningDataStructuresAndAlgorithmsTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    // Section 3: 13
    @Test func testGCD() {
        let model = GCDModel()
        
        let numberA = 78
        let numberB = 66
        let expectedResult = 6
        #expect(model.calculateGCD(numberA, numberB) == expectedResult)
        #expect(model.calculateRecursiveGCD(numberA, numberB) == expectedResult)
    }
    
    // Section 3: 14
    @Test func testLCM() {
        let model = GCDModel()
        
        let numberA = 12
        let numberB = 15
        let expectedResult = 60
        #expect(model.calculateLCM(numberA, numberB) == expectedResult)
    }
    
    // Section 3: 15,16
    @Test func testFactor() {
        let model = FactorModel()
        
        let number = 204
        let expectedResult = [2,2,3,17]
        #expect(model.calculateFactor(number) == expectedResult)
    }

    // Section 3: 17
    @Test func testPrimes() {
        let model = PrimesModel()
        
        let number = 10000
        let expectedResult = 1229
        let primes = model.findPrimes(upTo: number)
        print(primes)
        #expect(primes.count == expectedResult)
    }
    
    // Section 3: 18
    @Test func testNumericalIntegrationByRectangle() {
        let model = NumericalIntegrationModel()
        
        let minX = Double(0)
        let maxX = Double(5)
        let numberOfIntervals = 10
        let expectedResult = NumericalIntegrationResults(
            estimatedArea: 17.227604741,
            trueArea: 18.419535764,
            errorPercentage: -6.471)
        let result = model.calculateRectangleIntegration(
            minX: minX,
            maxX: maxX,
            intervals: numberOfIntervals)
        print(result)
        #expect(result == expectedResult)
    }
    
    // Section 3: 18
    @Test func testNumericalIntegrationByTrapezoid() {
        let model = NumericalIntegrationModel()
        
        let minX = Double(0)
        let maxX = Double(5)
        let numberOfIntervals = 10
        let expectedResult = NumericalIntegrationResults(
            estimatedArea: 18.341599463,
            trueArea: 18.419535764,
            errorPercentage: -0.423)
        let result = model.calculateTrapezoidIntegration(
            minX: minX,
            maxX: maxX,
            intervals: numberOfIntervals)
        print(result)
        #expect(result == expectedResult)
    }
}
