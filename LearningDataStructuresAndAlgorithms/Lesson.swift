//
//  Lesson.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

import Foundation

struct Lesson: Identifiable {
    let id: Int
    let title: String
    let hasView: Bool

    var description: String {
        get {
            "\(id): \(title)"
        }
    }
}

struct LessonGroup: Identifiable {
    let id: Int
    let title: String
    var isExpanded: Bool
    var lessons: [Lesson]
    
    var description: String {
        get {
            "Section \(id): \(title)"
        }
    }
    
    static func create() -> [LessonGroup] {
        [
            LessonGroup(id: 1, title: "Introduction", isExpanded: false, lessons: [
                Lesson(id: 1, title: "Important - Download These First - Working Files", hasView: false),
                Lesson(id: 2, title: "Introduction and Course Overview", hasView: false),
                Lesson(id: 3, title: "How to access Your Working Files", hasView: false),
            ]),
            LessonGroup(id: 2, title: "Complexity Theory", isExpanded: false, lessons: [
                Lesson(id: 4, title: "Complexity Theory", hasView: false),
                Lesson(id: 5, title: "Big O Notation", hasView: false),
                Lesson(id: 6, title: "Typical Runtime Functions", hasView: false),
                Lesson(id: 7, title: "Comparing Runtime Functions", hasView: false),
                Lesson(id: 8, title: "P and NP", hasView: false),
            ]),
            LessonGroup(id: 3, title: "Numerical Algorithms", isExpanded: false, lessons: [
                Lesson(id: 9, title: "Random Numbers", hasView: false),
                Lesson(id: 10, title: "Linear Congruential Generators", hasView: false),
                Lesson(id: 11, title: "Randomizing Arrays - Part 1 - Randomization Algorithm", hasView: false),
                Lesson(id: 12, title: "Randomizing Arrays - Part 2 - Randomize Two-Dimentional Arrays", hasView: false),
                Lesson(id: 13, title: "GCD", hasView: true),
                Lesson(id: 14, title: "LCM", hasView: true),
                Lesson(id: 15, title: "Prime Factorization - Part 1 - Factor", hasView: true),
                Lesson(id: 16, title: "Prime Factorization - Part 1 - Factoring Algorithm", hasView: true),
                Lesson(id: 17, title: "Finding Primes", hasView: false),
                Lesson(id: 18, title: "Testing Primality", hasView: false),
                Lesson(id: 19, title: "Numerical Integration", hasView: true),
            ]),
            LessonGroup(id: 4, title: "Linked Lists", isExpanded: false, lessons: [
                Lesson(id: 20, title: "Singly Linked Lists - Part 1 - Explanation", hasView: true),
            ]),
        ]
    }
}
