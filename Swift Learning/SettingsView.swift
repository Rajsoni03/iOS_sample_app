//
//  SettingsView.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var startingPoint: Int
    @Binding var doesHighestScoreWin: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Starting Point", selection: $startingPoint){
                Text("0 stating point")
                    .tag(0)
                Text("10 starting point")
                    .tag(10)
                Text("20 starting point")
                    .tag(20)
            }
            Picker("Win Condition", selection: $doesHighestScoreWin){
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var startingPoint: Int = 10
    @Previewable @State var doesHighestScoreWin: Bool = true
    SettingsView(startingPoint: $startingPoint,
                 doesHighestScoreWin: $doesHighestScoreWin)
}
