//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Vidhyapathi on 24/09/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var students: [Student]

    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("Swift Data Example")
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink(destination: CreateStudentFormWidget()) {
                        Text("+ Add")
                            .font(.system(size: 20))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .padding(.trailing, 20)
                }
                
                ScrollView(.vertical) {
                    ForEach(students) { student in
                        NavigationLink(destination: CreateStudentFormWidget()) {
                            StudentListWidgets(student: student)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Student.self, inMemory: true)
}
