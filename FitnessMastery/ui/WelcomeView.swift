//
//  WelcomeView.swift
//  FitnessMastery
//
//  Created by Mako CP on 30.06.23.
//

import SwiftUI

private let counter = 7

struct WelcomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Counter: \(counter)")
        }.onAppear(){
            print("The view will appear with counter \(counter)")
        }.task {
            print("background task with counter \(counter)")
        } .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
