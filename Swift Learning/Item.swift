//
//  Item.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
