//
//  Player.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import Foundation

struct Player : Identifiable {
    
    let id: UUID = UUID()
    
    var name: String
    var score: Int
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
