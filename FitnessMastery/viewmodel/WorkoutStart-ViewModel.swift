//
//  WorkoutStart-ViewModel.swift
//  FitnessMastery
//
//  Created by Mako CP on 10.07.23.
//

import Foundation

extension WorkoutStartView {
    final class ViewModel: ObservableObject {
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var displayTime: String = "0:00"
        
        private var initialTime = 0
        private var endDate = Date()
        
        func start(minutes: Float) {
            self.initialTime = Int(minutes)
            self.isActive = true
        }
        
        func test(){
            print("viewmodel extension test")
        }
        
        func updateCountdown(){
            guard isActive else { return }
            
        }
    }
}
