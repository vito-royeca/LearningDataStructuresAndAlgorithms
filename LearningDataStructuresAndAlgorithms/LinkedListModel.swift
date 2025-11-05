//
//  LinkedListModel.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import Foundation
import Combine

class LinkedListModel<T: Equatable>: ObservableObject {
    @Published var node: Node<T>?
    @Published var count = 0
    
    private var linkedList = LinkedList<T>()
    
    // MARK: - Utility methods
    
    func getLastValue() -> T? {
        linkedList.getLast()
    }

    func append(at position: Int) {
        linkedList.insert(randomHexNumber() as! T, at: position)
        node = linkedList.head
        count = linkedList.count
    }
    
    func appendAtTail() {
        linkedList.addTail(randomHexNumber() as! T)
        
        node = linkedList.head
        count = linkedList.count
    }

    func delete(at position: Int) {
        linkedList.delete(at: position)
        
        node = linkedList.head
        count = linkedList.count
    }
    
    func delete(node: Node<T>) {
        linkedList.delete(node: node)
        
        self.node = linkedList.head
        count = linkedList.count
    }
    
    func create() {
        linkedList.addHead(randomHexNumber() as! T)
        
        node = linkedList.head
        count = linkedList.count
        
        linkedList.printList()
    }
    
    func createSampleData() {
        linkedList.clear()
        
        for i in 0..<10 {
            linkedList.insert(randomHexNumber() as! T, at: i)
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
