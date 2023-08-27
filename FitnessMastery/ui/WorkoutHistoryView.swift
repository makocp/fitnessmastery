//
//  WorkoutHistoryView.swift
//  FitnessMastery
//
//  Created by Mako CP on 27.08.23.
//

import SwiftUI

struct WorkoutHistoryView: View {
    
    var body: some View {
        
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]),
                center: .top,
                startRadius: 5,
                endRadius: 1000)
            .ignoresSafeArea()

            Text("History")
        }
        
    }
}
