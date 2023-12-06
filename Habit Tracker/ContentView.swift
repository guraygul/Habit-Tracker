//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var habits = Habits()
    @State private var showingAddHabits = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(habits.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            NavigationLink {
                                List {
                                    Text("Habit name: \(item.name)")
                                        .font(.headline)
                                    Text("Habit detials: \(item.detail)")
                                }
                            } label: {
                                Text(item.name)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add Habits", systemImage: "plus") {
                    showingAddHabits = true
                }
            }
            .sheet(isPresented: $showingAddHabits) {
                AddView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
