//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Raj Soni on 19/12/24.
//

import Testing
@testable import Swift_Learning

struct ScoreKeeperTests {

    @Test("Reset player score", arguments: [0, 10, 20, 30])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(
            players: [
                Player(name: "Player 1", score: 10),
                Player(name: "Player 2", score: 20),
                Player(name: "Player 3", score: 30)
            ]
        )
        scoreboard.resetScore(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Player 1", score: 10),
                Player(name: "Player 2", score: 20),
                Player(name: "Player 3", score: 30)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        
        let winner = scoreboard.winners
        #expect(winner == [Player(name: "Player 3", score: 30)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Player 1", score: 10),
                Player(name: "Player 2", score: 20),
                Player(name: "Player 3", score: 30)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winner = scoreboard.winners
        #expect(winner == [Player(name: "Player 1", score: 10)])
    }

}
