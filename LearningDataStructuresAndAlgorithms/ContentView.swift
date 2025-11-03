//
//  ContentView.swift
//  LearningDataStructuresAndAlgorithms
//
//  Created by Vito Royeca on 10/30/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var lessonGroups = LessonGroup.create()
    @State private var selectedLesson: Lesson?

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(lessonGroups) { group in
                    Section(header: Text(group.description)) {
                        ForEach(group.lessons) { lesson in
                            NavigationLink(lesson.description) {
                                NavigationStack {
                                    lessonView(lesson: lesson)
                                        .navigationTitle(lesson.description)
                                }
                            }
                        }
                    }
                }
            }
#if os(iOS) || os(tvOS)
            .listStyle(.grouped)
#endif
#if os(macOS)
            
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        } detail: {
            Text("Select an item")
                
        }
        
    }
    
    func lessonView(lesson: Lesson) -> AnyView {
        switch lesson.id {
        case 13, 14:
            return AnyView(GCDView())
        default:
            return AnyView(Text("TODO"))
        }
    }
}

#Preview {
    ContentView()
}
