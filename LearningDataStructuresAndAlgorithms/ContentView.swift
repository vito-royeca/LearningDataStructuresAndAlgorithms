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
                            if lesson.hasView {
                                NavigationLink(lesson.description) {
                                    NavigationStack {
                                        lessonView(lesson: lesson)
                                            .navigationTitle(lesson.description)
                                    }
                                }
                            } else {
                                Text(lesson.description)
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
        case 15, 16:
            return AnyView(FactorView())
        case 19:
            return AnyView(NumericalIntegrationView())
        default:
            return AnyView(Text("TODO"))
        }
    }
}

#Preview {
    ContentView()
}
