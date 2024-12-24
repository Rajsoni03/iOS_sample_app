//
//  Friend.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    
    var favoriteMovie: Movie?
    
    init(name: String, birthday: Date){
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
    
    static let sampleData: [Friend] = [
        Friend(name: "Raj", birthday: Date()),
        Friend(name: "Rakesh", birthday: Date()),
        Friend(name: "mukesh", birthday: Date()),
        Friend(name: "Elena", birthday: Date()),
        Friend(name: "Graham", birthday: Date()),
        Friend(name: "Mayuri", birthday: Date()),
        Friend(name: "Rich", birthday: Date()),
        Friend(name: "Rody", birthday: Date())
    ]
}
