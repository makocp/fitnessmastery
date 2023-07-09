//
//  Workout.swift
//  FitnessMastery
//
//  Created by Mako CP on 08.07.23.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    var title: String
    var sets: [Set]
}
