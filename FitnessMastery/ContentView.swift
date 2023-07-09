//
//  ContentView.swift
//  FitnessMastery
//
//  Created by Mako CP on 29.06.23.
//

import SwiftUI

struct ContentView: View {
    
    let workouts = [
        Workout(title: "Chest Easy", sets: [Set(amount: 50, setName: "Push-Up"), Set(amount: 50, setName: "Dip")]),
        Workout(title: "Chest Medium", sets: [Set(amount: 100, setName: "Push-Up"), Set(amount: 100, setName: "Dip")]),
        Workout(title: "Back Medium", sets: [Set(amount: 50, setName: "Pull-Up")]),
        Workout(title: "Back Hard", sets: [Set(amount: 100, setName: "Pull-Up")]),
        Workout(title: "Core Medium", sets: [Set(amount: 100, setName: "Crunch"), Set(amount: 100, setName: "Side Crunch")]),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(workouts) { workout in
                    NavigationLink(destination: WorkoutStartView(workout: workout)){
                        WorkoutRowView(workout: workout)
                    }
                }
            }
            .navigationTitle("Choose a workout")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
