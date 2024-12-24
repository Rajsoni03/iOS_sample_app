//
//  FeaturesPage.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Features Page")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 20)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill",
                        description: "A multiline description about a feature paired with the image on the left.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short summary")
            
            Spacer()

        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
}
