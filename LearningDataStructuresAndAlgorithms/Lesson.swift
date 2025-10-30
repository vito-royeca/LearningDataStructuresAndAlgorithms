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
    
    var description: String {
        get {
            "\(id): \(title)"
        }
    }
}

struct LessonGroup: Identifiable {
    let id: Int
    let title: String
    let lessons: [Lesson]
    
    var description: String {
        get {
            "Section \(id): \(title)"
        }
    }
    
    static func create() -> [LessonGroup] {
        [
            LessonGroup(id: 1, title: "Introduction", lessons: [
                Lesson(id: 1, title: "Important - Download These First - Working Files"),
                Lesson(id: 2, title: "Introduction and Course Overview"),
                Lesson(id: 3, title: "How to access Your Working Files")
            ]),
            LessonGroup(id: 2, title: "Complexity Theory", lessons: [
                Lesson(id: 4, title: "Complexity Theory"),
                Lesson(id: 5, title: "Big O Notation"),
                Lesson(id: 6, title: "Typical Runtime Functions"),
                Lesson(id: 7, title: "Comparing Runtime Functions"),
                Lesson(id: 8, title: "P and NP"),
            ]),
            LessonGroup(id: 3, title: "Numerical Algorithms", lessons: [
                Lesson(id: 9, title: "Random Numbers"),
                Lesson(id: 10, title: "Linear Congruential Generators"),
                Lesson(id: 11, title: "Randomizing Arrays - Part 1 - Randomization Algorithm"),
                Lesson(id: 12, title: "Randomizing Arrays - Part 2 - Randomize Two-Dimentional Arrays"),
                Lesson(id: 13, title: "GCD"),
                
            ])
        ]
    }
}
