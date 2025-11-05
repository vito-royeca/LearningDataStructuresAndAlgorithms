//
//  LinkedList.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import Foundation

class Node<T: Equatable> {
    var value: T
    var next: Node<T>?

    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>?
    var count = 0
    
    func addHead(_ value: T) {
        count = head == nil ? 1 : count + 1
        
        let newNode = Node(value: value, next: head)
        head = newNode
    }

    func addTail(_ value: T) {
        let newNode = Node(value: value)

        guard let currentHead = head else {
            head = newNode
            count = 1
            return
        }

        var current = currentHead
        while let next = current.next {
            current = next
        }
        current.next = newNode
        count += 1
    }

    func insert(_ value: T, at position: Int) {
        guard position >= 0 else { return }

        if position == 0 {
            addHead(value)
            return
        }

        var current = head
        var currentIndex = 0

        while current != nil && currentIndex < position - 1 {
            current = current?.next
            currentIndex += 1
        }

        guard let nodeBefore = current else { return }

        let newNode = Node(value: value, next: nodeBefore.next)
        nodeBefore.next = newNode
        count += 1
    }

    func getFirst() -> T? {
        head?.value
    }

    func getLast() -> T? {
        guard var current = head else { return nil }

        while let next = current.next {
            current = next
        }
        return current.value
    }

    func deleteHead() {
        head = head?.next
        count -= 1
    }

    func deleteLast() {
        guard var current = head else { return }

        if current.next == nil {
            head = nil
            count = 0
            return
        }

        while let next = current.next, next.next != nil {
            current = next
        }

        current.next = nil
        count -= 1
    }

    func delete(at position: Int) {
        guard position >= 0, head != nil else { return }

        if position == 0 {
            deleteHead()
            return
        }

        var current = head
        var currentIndex = 0

        while current != nil && currentIndex < position - 1 {
            current = current?.next
            currentIndex += 1
        }

        guard let nodeBefore = current,
              nodeBefore.next != nil else { return }

        nodeBefore.next = nodeBefore.next?.next
        count -= 1
    }

    func delete(node: Node<T>) {
        guard head != nil else { return }

        var current = head
        var previous: Node<T>?

        if current?.value == node.value {
            deleteHead()
            return
        }

        while current != nil && current?.value != node.value {
            previous = current
            current = current?.next
        }

        previous?.next = current?.next
        count -= 1
    }
    
    func clear() {
        head = nil
        count = 0
    }

    func reverse() {
        var previous: Node<T>? = nil
        var current = head
        var next: Node<T>? = nil

        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }

        head = previous
    }

    func printList() {
        var current = head

        while let node = current {
            print(node.value)
            current = node.next
        }
    }
}
