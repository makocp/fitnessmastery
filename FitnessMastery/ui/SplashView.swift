//
//  SplashView.swift
//  FitnessMastery
//
//  Created by Mako CP on 11.08.23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4735229611, green: 0.8339873552, blue: 0.9761376977, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]),
                center: .top,
                startRadius: 5,
                endRadius: 1000)
            .ignoresSafeArea()
            Image("splash_icon")
            if self.isActive {
                ChooseWorkoutView()
            }
            else {
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
