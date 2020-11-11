//
//  ContentView.swift
//  HabitTracker
//
//  Created by Juliette Rapala on 11/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("HabitTracker")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showAddHabit.toggle()
                }) {
                    Text("Add New Habit")
                }
            )
        }
        .sheet(isPresented: $showAddHabit) {
            AddView(habits: self.habits)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}


class Habits: ObservableObject {
    @Published var items: [HabitItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
