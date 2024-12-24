//
//  MovieDetail.swift
//  Swift Learning
//
//  Created by Raj Soni on 22/12/24.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(movie: Movie, isNew: Bool = false){
        self.movie = movie
        self.isNew = isNew
    }
    
    var sortedFriends: [Friend] {
        movie.favoritedBy.sorted { first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $movie.title)
                .disableAutocorrection(true)
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty {
                Section("Favorited By"){
                    ForEach(sortedFriends){ friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
            if isNew {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        MovieDetail(movie: SampleData.shared.movie)
    }
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
