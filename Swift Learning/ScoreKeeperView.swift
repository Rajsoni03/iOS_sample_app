//
//  ScoreKeeperView.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import SwiftUI

struct ScoreKeeperView: View {
    @State private var scoreboard: Scoreboard = Scoreboard()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(startingPoint: $scoreboard.startingPoints,
                         doesHighestScoreWin: $scoreboard.doesHighestScoreWin)
            .disabled(scoreboard.state != .setup)
            
            Grid{
                GridRow{
                    Text("Name")
                        .gridColumnAlignment(.leading)
                    Text("Score").opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow{
                        HStack{
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                            .disabled(scoreboard.state == .gameOver)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus.circle.fill") {
                scoreboard.players.append(Player(name: "Player \(scoreboard.players.count + 1)",
                                                 score: scoreboard.startingPoints))
            }.disabled(scoreboard.state != .setup)
            
            Spacer()
            
            HStack{
                Spacer()
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScore(to: scoreboard.startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Restart Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(scoreboard.state == .setup ? .blue: scoreboard.state == .playing ? .red : .primary)
        }.padding()
    }
}

#Preview {
    ScoreKeeperView()
}
