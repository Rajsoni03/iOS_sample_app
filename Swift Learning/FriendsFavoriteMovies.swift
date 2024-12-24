//
//  FriendsFavoriteMovies.swift
//  Swift Learning
//
//  Created by Raj Soni on 21/12/24.
//

import SwiftUI

struct FriendsFavoriteMovies: View {
    var body: some View {
        TabView{
            Tab("Friends", systemImage: "person.and.person.fill") {
                FriendList()
            }
            Tab("Movie", systemImage: "film.stack") {
                FilteredMovieList()
            }
        }.tabViewStyle(.automatic)
    }
}

#Preview {
    FriendsFavoriteMovies()
        .modelContainer(SampleData.shared.modelContainer)
}
