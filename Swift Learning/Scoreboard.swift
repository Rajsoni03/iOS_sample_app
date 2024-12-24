//
//  Scoreboard.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Player 1", score: 0),
        Player(name: "Player 2", score: 0),
        Player(name: "Player 3", score: 0),
    ]
    
    var state = GameState.setup
    var startingPoints: Int = 0
    var doesHighestScoreWin: Bool = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScores: Int = 0
        if doesHighestScoreWin {
            winningScores = players.max(by: { $0.score < $1.score })?.score ?? 0
        }
        else {
            winningScores = players.min(by: { $0.score < $1.score })?.score ?? 0
        }
        
        return players.filter{ players in
            players.score == winningScores
        }
    }
    
    
    mutating func resetScore(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
