//
//  LinkedListModel.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import Foundation
import Combine

class LinkedListModel: ObservableObject {
    @Published var node: Node<String>?
    @Published var count = 0
    
    @Published var linkedList = LinkedList<String>()
    
    // MARK: - Utility methods
    
    func append(at position: Int) {
        linkedList.insert(randomHexNumber(), at: position)
        node = linkedList.head
        count = linkedList.count
    }
    
    func appendAtTail() {
        linkedList.addTail(randomHexNumber())
        
        node = linkedList.head
        count = linkedList.count
    }

    func delete(at position: Int) {
        linkedList.delete(at: position)
        
        node = linkedList.head
        count = linkedList.count
    }
    
    func delete(value: String) {
        linkedList.delete(value: value)
        
        node = linkedList.head
        count = linkedList.count
    }
    
    func create() {
        linkedList.addHead(randomHexNumber())
        
        node = linkedList.head
        count = linkedList.count
        
        linkedList.printList()
    }
    
    func createSampleData() {
        linkedList.clear()
        
        for i in 0..<10 {
            linkedList.insert(randomHexNumber(), at: i)
        }
        
        node = linkedList.head
        count = linkedList.count
    }

    func randomHexNumber() -> String {
        let a = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];
        return  "#".appending(a[Int(arc4random_uniform(15))])
                   .appending(a[Int(arc4random_uniform(15))])
                   .appending(a[Int(arc4random_uniform(15))])
                   .appending(a[Int(arc4random_uniform(15))])
                   .appending(a[Int(arc4random_uniform(15))])
                   .appending(a[Int(arc4random_uniform(15))])
    }
}
