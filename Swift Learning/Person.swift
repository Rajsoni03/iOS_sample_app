//
//  Person.swift
//  Swift Learning
//
//  Created by Raj Soni on 21/12/24.
//

import Foundation
import SwiftData

@Model
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}
