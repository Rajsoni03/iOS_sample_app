//
//  DiceRollerPage.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI

struct DiceRollerPage: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack{
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .bold()

            
            HStack{
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()                }
            }
            
            HStack{
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }.disabled(numberOfDice == 10)
                
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation{
                        numberOfDice -= 1
                    }
                }.disabled(numberOfDice == 1)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }.padding()
    }
}

#Preview {
    DiceRollerPage()
}

// AA00E3N4CR
