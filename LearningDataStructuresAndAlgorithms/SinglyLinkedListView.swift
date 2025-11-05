//
//  SinglyLinkedListView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 11/3/25.
//

import SwiftUI

struct SinglyLinkedListView: View {
    @ObservedObject var model: LinkedListModel<String>
    
    var body: some View {
        if let node = model.node {
            VStack {
                ScrollView(.vertical) {
                    NodeView(node: node, index: 0)
                        .environmentObject(model)
                }
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
    @EnvironmentObject var model: LinkedListModel<String>
    var node: Node<String>
    var index: Int

    var body: some View {
        VStack {
            NodeContentView(node: node, index: index)

            if let nextNode = node.next {
                NodeView(node: nextNode, index: index + 1) // Recursion!
            }
        }
    }
}

struct NodeContentView: View {
    @EnvironmentObject var model: LinkedListModel<String>
    var node: Node<String>
    var index: Int

    var body: some View {
        VStack {
            if index == 0 {
                addHeadButton
            } else {
                addToPositionButton
            }
            ZStack {
                Circle()
                    .fill(Color(hex: node.value))
                VStack {
                    Text("\(index)")
                        .foregroundStyle(.white)
                    deleteButton
                }
            }
            .frame(
                width: 100,
                height: 100,
                alignment: .center
            )
            if node.next == nil {
                addTailButton
            }
        }
    }
    
    var addHeadButton: some View {
        Button(action: {
            model.append(at: 0)
        }, label: {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .tint(.pink)
        })
    }

    var addTailButton: some View {
        Button(action: {
            model.append(at: index + 1)
        }, label: {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .tint(.pink)
        })
    }

    var addToPositionButton: some View {
        Button(action: {
            model.append(at: index)
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
//            model.delete(node: node)
            model.delete(at: index)
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
    let model = LinkedListModel<String>()
    model.createSampleData()

    return SinglyLinkedListView(model: model)
}
