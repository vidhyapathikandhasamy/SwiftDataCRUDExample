//
//  CreateStudentFormWidget.swift
//  SwiftDataExample
//
//  Created by Vidhyapathi on 24/09/24.
//

import SwiftUI
import SwiftData

struct CreateStudentFormWidget: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.modelContext) private var modelContext
    
    @Environment(\.colorScheme) var colorScheme
    
    @Query private var students: [Student]
    
    @State private var studentName: String = ""
    @State private var studentAge: String = ""
    @State private var studentInfo: String = ""
    
    @State private var genderSelection = "Male"
    
    var gender = ["Male", "Female"]
    
//    @Bindable var student = Student
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Text("Add Student")
                    .font(.system(size: 20))
                    .padding(.bottom, 12)
                
                TextField("Student Name", text: $studentName)
                    .frame(height: 36)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
                    )
                
                TextField("Student Age", text: $studentAge)
                    .frame(height: 36)
                    .padding(8)
                    .keyboardType(.numberPad)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
                    )
                
                VStack {
                    Picker("", selection: $genderSelection) {
                        ForEach(gender, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(height: 40)
                    .clipped()
                }
                
                ZStack(alignment: .topLeading) {
                    
                    // TextEditor
                    TextEditor(text: $studentInfo)
                        .frame(height: 100)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
                        )
                    
                    // Placeholder text
                    VStack(alignment: .leading) {
                        if studentInfo.isEmpty {
                            Text("Student Info")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                }
                
                
                
                HStack(spacing: 20) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                    }
                    Button {
                        addStudent()
                    } label: {
                        Text("Save")
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(5)
                    }                }
                .padding(.top, 20)
                
            }
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
    
    private func addStudent() {
        withAnimation {
            do {
                let newItem = Student(timestamp: Date(), name: studentName, age: Int(studentAge) ?? 0, gender: genderSelection == "Male", info: studentInfo)
                modelContext.insert(newItem)
                try modelContext.save()
                dismiss()
            } catch {
                print(error)
            }
            
        }
    }
}

#Preview {
    CreateStudentFormWidget()
}
