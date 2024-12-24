//
//  SampleData.swift
//  Swift Learning
//
//  Created by Raj Soni on 21/12/24.
//

import Foundation
import SwiftData


@MainActor
class SampleData {
    static var shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self
        ])
        let modelConfigration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfigration])
            insertSampleData()
            try context.save()
        }
        catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[4]
        Friend.sampleData[4].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[5].favoriteMovie = Movie.sampleData[2]
    }
    
}
