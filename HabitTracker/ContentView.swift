//
//  ContentView.swift
//  HabitTracker
//
//  Created by Juliette Rapala on 11/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("HabitTracker")
            .navigationBarItems(trailing:
                Button(action: {
                    let habit = HabitItem(name: "Clean Dishes")
                    self.habits.items.append(habit)
                }) {
                    Text("Add New Habit")
                }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}


class Habits: ObservableObject {
    @Published var items = [HabitItem]()
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
