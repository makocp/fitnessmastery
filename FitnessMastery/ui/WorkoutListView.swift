//
//  WorkoutStartView.swift
//  FitnessMastery
//
//  Created by Mako CP on 09.07.23.
//

import SwiftUI

struct WorkoutListView: View {
    
    let workouts = [
        Workout(title: "Chest Easy", sets: [Set(amount: 50, setName: "Push-Up"), Set(amount: 50, setName: "Dip")]),
        Workout(title: "Chest Medium", sets: [Set(amount: 100, setName: "Push-Up"), Set(amount: 100, setName: "Dip")]),
        Workout(title: "Back Medium", sets: [Set(amount: 50, setName: "Pull-Up")]),
        Workout(title: "Back Hard", sets: [Set(amount: 100, setName: "Pull-Up")]),
        Workout(title: "Core Medium", sets: [Set(amount: 100, setName: "Crunch"), Set(amount: 100, setName: "Side Crunch")]),
    ]
    
    var body: some View {
            ZStack{
                RadialGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                    center: .top,
                    startRadius: 5,
                    endRadius: 1000)
                .ignoresSafeArea()
                
                List {
                    ForEach(workouts) { workout in
                        NavigationLink(destination: WorkoutTimerView(workout: workout)){
                            WorkoutRowView(workout: workout)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            }
        }
}
