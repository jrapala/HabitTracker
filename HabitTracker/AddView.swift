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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add a New Habit")
            .navigationBarItems(trailing: Button("Save") {
                let item = HabitItem(name: self.name)
                self.habits.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
