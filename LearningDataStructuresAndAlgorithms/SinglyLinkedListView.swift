//
//  SinglyLinkedListView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import SwiftUI

struct SinglyLinkedListView: View {
    @ObservedObject var model: LinkedListModel
    
    var body: some View {
        if let node = model.node {
            VStack {
                ScrollView(.vertical) {
                    NodeView(node: node)
                        .environmentObject(model)
                }
                .frame(
                    width: 60,
//                    height: CGFloat((model.count + 2) * 60),
                    alignment: .center
                )
                Text("Count: \(model.count)")
            }
        } else {
            newButton
        }
    }
    
    var newButton: some View {
        Button(action: {
            model.create()
        }, label: {
            Image(systemName: "link.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .tint(.pink)
        })
    }
}

struct NodeView: View {
    @EnvironmentObject var model: LinkedListModel
    var node: Node<String>

    var body: some View {
        VStack {
            NodeContentView(node: node)

            if let nextNode = node.next {
                NodeView(node: nextNode) // Recursion!
            }
        }
    }
}

struct NodeContentView: View {
    @EnvironmentObject var model: LinkedListModel
    var node: Node<String>

    var body: some View {
        VStack {
            if node.value == model.node?.value {
                addToTopButton
            }
            ZStack {
                Circle()
                    .fill(Color(hex: node.value))
                deleteButton
            }
            .frame(
                width: 100,
                height: 100,
                alignment: .center
            )
            addToBottomButton
        }
    }
    
    var addToTopButton: some View {
        Button(action: {
            model.append(at: 0)
        }, label: {
            Image(systemName: "link.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .tint(.pink)
        })
    }
    
    var addToBottomButton: some View {
        Button(action: {
            model.appendAtTail()
        }, label: {
            Image(systemName: "link.badge.plus")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .tint(.pink)
        })
    }
    
    var deleteButton: some View {
        Button(action: {
            model.delete(value: node.value)
        }, label: {
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
        })
    }
}

#Preview {
    let model = LinkedListModel()
//    model.createSampleData()

    return SinglyLinkedListView(model: model)
//        .environmentObject(model)
}
