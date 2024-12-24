//
//  FriendList.swift
//  Swift Learning
//
//  Created by Raj Soni on 21/12/24.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) var friends: [Friend]
    @Environment(\.modelContext) var context
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationSplitView {
            Group {
                if !friends.isEmpty {
                    List {
                        ForEach(friends) { friend in
                            NavigationLink(friend.name){
                                FriendDetail(friend: friend)
                            }
                        }
                        .onDelete(perform: deleteFriend(indexes:))
                    }
                } else {
                    ContentUnavailableView("Add Friends", systemImage: "person.and.person")
                }
            }
            .navigationTitle(Text("Friends"))
            .toolbar{
                ToolbarItem{
                    Button("Add Friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
            .sheet(item: $newFriend){ friend in
                NavigationStack {
                    FriendDetail(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled(true)
            }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addFriend() {
        let newFriend = Friend(name: "", birthday: Date.now)
        context.insert(newFriend)
        self.newFriend = newFriend
    }
    
    private func deleteFriend(indexes: IndexSet) {
        for index in indexes {
            context.delete(friends[index])
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}


#Preview("Empty List") {
    FriendList()
}
