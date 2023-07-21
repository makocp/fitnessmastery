//
//  ContentView.swift
//  FitnessMastery
//
//  Created by Mako CP on 29.06.23.
//

import SwiftUI

struct ChooseWorkoutView: View {
    
    
    var body: some View {
        
        NavigationView{
            TabView{
                StartWorkoutView()
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

struct StartWorkoutView: View {
    
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
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 1000)
                .ignoresSafeArea()
                
                List {
                    ForEach(workouts) { workout in
                        NavigationLink(destination: WorkoutStartView(workout: workout)){
                            WorkoutRowView(workout: workout)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            }
        }
}

struct WorkoutHistoryView: View {
    
    var body: some View {
        
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 1000)
            .ignoresSafeArea()

            Text("History")
        }
        
    }
}

struct WorkoutStartView: View {
    
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250

    var workout: Workout
    
    var body: some View {
        
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 1000)
            .ignoresSafeArea()

            VStack {
                List {
                    ForEach(workout.sets) { set in
                        HStack(){
                            Text(String(set.amount)+"x")
                                .padding(.horizontal)
                            Text(set.setName)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .navigationTitle(workout.title)
                
                Text("TEXT")
                    .onReceive(timer) { _ in
                        vm.updateCountdown()
                    }
                Button {
                    //TODO: Implement onclick -> Timer Start!
                } label: {
                    Text("Start Workout".uppercased())
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding(10)
                        .padding(.horizontal, 70)
                        .background(
                            Capsule()
                        )
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseWorkoutView()
    }
}
