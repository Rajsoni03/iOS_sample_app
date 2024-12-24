//
//  FilteredMovieList.swift
//  Swift Learning
//
//  Created by Raj Soni on 24/12/24.
//

import SwiftUI

struct FilteredMovieList: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        }
        detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
