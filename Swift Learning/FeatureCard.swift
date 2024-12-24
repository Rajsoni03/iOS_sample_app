//
//  FeatureCard.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            
            Text(description)
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint)
//                .opacity(0.25)
//                .brightness(-0.5)
        )
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(iconName: "book.circle.fill",
                 description: "A multiline description about a feature paired with the image on the left.")
}
