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
    
    // Section 3, 13
    @Test func testGCD() {
        let model = GCDModel()
        
        let numberA = 78
        let numberB = 66
        let expectedResult = 6
        #expect(model.calculateGCD(numberA, numberB) == expectedResult)
        #expect(model.calculateRecursiveGCD(numberA, numberB) == expectedResult)
    }
    
    // Section 3, 14
    @Test func testLCM() {
        let model = GCDModel()
        
        let numberA = 12
        let numberB = 15
        let expectedResult = 60
        #expect(model.calculateLCM(numberA, numberB) == expectedResult)
    }

}
