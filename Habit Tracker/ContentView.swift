//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Güray Gül on 5.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Habits()
    @State private var showingAddHabits = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.habits) { activity in
                    NavigationLink {
                        HabitView(data: data, habit: activity)
                    } label: {
                        HStack {
                            Text(activity.name)
                            
                            Spacer()
                            
                            Text(String(activity.habitCount))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add Habits", systemImage: "plus") {
                    showingAddHabits.toggle()
                }
            }
            .sheet(isPresented: $showingAddHabits) {
                AddView(data: data)
            }
        }
    }
    
    func color(for activity: HabitItem) -> Color {
        if activity.habitCount < 3 {
            .red
        } else if activity.habitCount < 10 {
            .orange
        } else if activity.habitCount < 20 {
            .green
        } else if activity.habitCount < 50 {
            .blue
        } else {
            .indigo
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        data.habits.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
