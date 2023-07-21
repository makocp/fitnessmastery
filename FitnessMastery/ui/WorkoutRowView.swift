//
//  WorkoutRowView.swift
//  FitnessMastery
//
//  Created by Mako CP on 09.07.23.
//

import SwiftUI

struct WorkoutRowView: View {
    
    var workout: Workout
    
    var body: some View{
        VStack(alignment: .leading, spacing: 3){
            Text(workout.title)
                .font(.title2)
            ForEach(workout.sets){ set in
                HStack(){
                    Text(String(set.amount)+"x")
                        .padding(.horizontal)
                    Text(set.setName)
                }
                .font(.subheadline)
                .foregroundColor(.primary)
            }
        }
        .listRowBackground(Color.clear)
    }
}
