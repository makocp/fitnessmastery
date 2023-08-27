//
//  TimerStartView.swift
//  FitnessMastery
//
//  Created by Mako CP on 27.08.23.
//

import SwiftUI
import AudioToolbox

struct WorkoutTimerView: View {
    
    @StateObject private var vm = TimerStartViewmodel()
    
    
    var workout: Workout
    
    var body: some View {
        
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                center: .top,
                startRadius: 5,
                endRadius: 1000)
            .ignoresSafeArea()
            
            VStack {
                // to show the workout sets
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
                
                // to show the current timer duration
                Text(vm.time.formattedTime)
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                    .padding(10)
                    .padding(.horizontal, 70)
                
                // to show the start/finish button
                HStack{
                    Button {
                        vm.toggleTimer()
                    } label: {
                        Text(vm.buttonText.uppercased())
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
            }
            .scrollContentBackground(.hidden)
        }
        .alert(isPresented: $vm.showFinishedDialog) {
            Alert(
                title: Text("Workout Finished"),
                message: Text("Time: \(vm.time.formattedTime)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

extension WorkoutTimerView {
    final class TimerStartViewmodel: ObservableObject {
        
        @Published var time: TimeInterval = 0.0
        @Published var isRunning: Bool = false
        @Published var buttonText: String = "Start Workout"
        @Published var showFinishedDialog = false
        private var timer: Timer?
        
        func toggleTimer(){
            if isRunning {
                stopTimer()
                showFinishedDialog = true
                saveWorkoutToHistory()
            } else {
                startTimer()
            }
        }
        
        func startTimer(){
            isRunning = true
            buttonText = "Finish Workout"
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.time += 1.0
            }
        }
        
        func stopTimer(){
            isRunning = false;
            buttonText = "Start Workout"
            timer?.invalidate()
            vibrate()
        }
        
                
        func saveWorkoutToHistory(){
            
        }
        
        func vibrate(){
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate), nil)
        }
        
    }
}

extension TimeInterval {
    var formattedTime: String {
        let hours = Int(self) / 3600
        let minutes = (Int(self) % 3600) / 60
        let seconds = Int(self) % 60
        
        let hoursString = hours > 0 ? "\(hours) h" : ""
        let minutesString = minutes > 0 ? "\(minutes) min" : ""
        let secondsString = seconds > 0 ? "\(seconds) s" : ""
        
        return "\(hoursString) \(minutesString) \(secondsString)"
    }
}
