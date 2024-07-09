//
//  ContentView.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                execute()
            } label: {
                ZStack {
                    Image(systemName: "globe")
                        .font(.system(size: 60.0).bold())
                        .foregroundStyle(Color.white)
                }
                .frame(width: 300.0, height: 120.0)
            }
        }
        .padding(.all, 60.0)
    }
    
    private func execute() {
        DispatchQueue.global(qos: .background).async {
            let simulation = Simulation()
            simulation.generateSuperHumanIntelligence()
        }
    }
}
