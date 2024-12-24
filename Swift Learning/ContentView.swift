//
//  ContentView.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
#if os(iOS)
        TabView {
            Tab("Friends Favorite Movies", systemImage: "movieclapper"){
                FriendsFavoriteMovies()
            }
            Tab("Home", systemImage: "house") {
                WelcomePage()
                    .foregroundStyle(.white)
            }
            Tab("Features", systemImage: "gearshape.fill") {
                FeaturesPage()
                    .foregroundStyle(.white)
            }
            Tab("Dice Roller", systemImage: "dice.fill") {
                DiceRollerPage()
            }
            Tab("Name Picker", systemImage: "person.3.fill"){
                NamePickerView()
            }
            Tab("Score Keeper", systemImage: "figure.australian.football"){
                ScoreKeeperView()
            }
            Tab("Birthdays", systemImage: "birthday.cake.fill"){
                Birthdays()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
#elseif os(macOS)
        NavigationView{
            List {
                NavigationLink("Home"){
                    WelcomePage()
                        .foregroundStyle(.white)
                }
                NavigationLink("Features"){
                    FeaturesPage()
                        .foregroundStyle(.white)
                }
                NavigationLink("Dice Roller"){
                    DiceRollerPage()
                }
                NavigationLink("Name Picker"){
                    NamePickerView()
                }
                NavigationLink("Score Keeper"){
                    ScoreKeeperView().padding(.top, 20)
                }
                NavigationLink("Birthdays"){
                    Birthdays()
                }
            }.listStyle(.sidebar)
            Text("No selection")
        }
#endif
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
