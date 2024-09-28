//
//  StudentListWidgets.swift
//  SwiftDataExample
//
//  Created by Vidhyapathi on 24/09/24.
//

import SwiftUI

struct StudentListWidgets: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var showingAlert = false

    var student: Student
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 18) {
                    Image(systemName: student.gender ? "arrow.up" : "arrow.down")
                        .frame(width: 80, height: 80)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 6)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                        )
                    VStack(alignment: .leading, spacing: 6) {
                        Text(student.name)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        HStack {
                            Text("\(student.age)")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text(student.gender ? "Male" : "Female")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .frame(maxWidth: .infinity)
                    Button {
                        self.deleteStudent()
                    } label: {
                        Image(systemName: "trash.circle.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                    }
                }
                .frame(maxWidth: .infinity)
                Text(student.info)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(student.gender ? Color.blue.opacity(0.8) : Color.pink.opacity(0.8))
            .clipShape(
                RoundedRectangle(cornerRadius: 6)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.blue.opacity(0.5), lineWidth: 0)
            )
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        
        
    }
    
    private func deleteStudent() {
        modelContext.delete(student)
        do {
            try modelContext.save()
        } catch {
            print(error)
        }
    }
}

struct StudentListWidgets_Previews: PreviewProvider {
    static var previews: some View {
        let student = Student(timestamp: Date(), name: "Vidhyapathi", age: 23, gender: true, info: "Lorem Ipsum is ")
        StudentListWidgets(student: student)
            .previewLayout(.sizeThatFits)
    }
}
