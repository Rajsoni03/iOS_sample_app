//
//  DiceView.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack{
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .onTapGesture {
                    withAnimation{
                        numberOfPips = Int.random(in: 1...6)
                    }
                }
            
            Button("Roll") {
                withAnimation{
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
            .padding(.top)
        }
    }
}

#Preview {
    DiceView()
}
