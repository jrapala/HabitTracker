//
//  AddView.swift
//  HabitTracker
//
//  Created by Juliette Rapala on 11/11/20.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @ObservedObject var habits: Habits
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add a New Habit")
            .navigationBarItems(trailing: Button("Save") {
                if self.name.count > 0 {
                    let item = HabitItem(name: self.name)
                    self.habits.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    alertTitle = "Invalid Habit Name"
                    alertMessage = "Please enter a name for your new habit"
                    showAlert.toggle()
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMessage),  dismissButton: .default(Text("OK"))
                )
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
