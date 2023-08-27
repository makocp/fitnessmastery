//
//  ContentView.swift
//  FitnessMastery
//
//  Created by Mako CP on 29.06.23.
//

import SwiftUI

struct ChooseWorkoutView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "Secondary")
    }

    var body: some View {
        
        NavigationView{
            TabView{
                WorkoutListView()
                    .tabItem {
                        Label("Start Workout", systemImage: "person.crop.circle.fill")
                    }
                WorkoutHistoryView()
                    .tabItem {
                        Label("History", systemImage: "tray.and.arrow.up.fill")
                    }
            }
        }
    }
}
