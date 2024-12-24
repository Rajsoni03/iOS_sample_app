//
//  FriendDetail.swift
//  Swift Learning
//
//  Created by Raj Soni on 22/12/24.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .disableAutocorrection(true)
            Picker("Favorite Movie", selection: $friend.favoriteMovie){
                Text("None").tag(nil as Movie?)
                ForEach(movies){ movie in
                    Text(movie.title).tag(movie)
                }
            }
            DatePicker("Birthday", selection: $friend.birthday, displayedComponents: .date)
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
            if isNew {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        FriendDetail(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
