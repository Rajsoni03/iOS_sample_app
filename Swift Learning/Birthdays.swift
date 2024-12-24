//
//  Birthdays.swift
//  Swift Learning
//
//  Created by Raj Soni on 19/12/24.
//

import SwiftUI
import SwiftData

struct Birthdays: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName: String = ""
    @State private var newDate: Date = Date.now
    
    var body: some View {
        NavigationStack {
            Text("Birthdays")
                .font(.title)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            
            List(friends){ friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
//                    Button("Remove Birthday", systemImage: "xmark.bin.fill"){
//                        context.delete(friend)
//                    }
//                    .foregroundColor(.red)
//                    .labelStyle(.iconOnly)
                }
            }
            .safeAreaInset(edge: .bottom){
                VStack(alignment: .center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now,
                               displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = Date.now
                    }
                    .bold()
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .tint(.blue)
                    .disabled(newName.isEmpty)
                }
                .padding()
                .background(.bar)
            }
//                .task {
//                    context.insert(Friend(name: "Raj", birthday: .now))
//                    context.insert(Friend(name: "Shreyash", birthday: Date(timeIntervalSince1970: 0)))
//                }
        }
    }
}

#Preview {
    Birthdays()
        .modelContainer(SampleData.shared.modelContainer)
}
