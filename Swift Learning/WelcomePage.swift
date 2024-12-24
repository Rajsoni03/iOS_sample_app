//
//  WelcomePage.swift
//  Swift Learning
//
//  Created by Raj Soni on 18/12/24.
//

import SwiftUI


struct WelcomePage: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                Image(systemName: "book.circle.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
            }
            Text("Welcome to Swift Learning")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("A great place to learn Swift")
                .font(.title2)
            
            HStack{
                DayView(day: "Mon", high: 70, low: 50, isRainy: false)
                DayView(day: "Tue", high: 45, low: 43, isRainy: true)
            }
        }
        .padding()
    }
}


#Preview {
    WelcomePage()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
}

struct DayView: View {
    let day: String
    let high: Int
    let low: Int
    let isRainy: Bool
    
    var iconName: String {
        isRainy ? "cloud.rain.fill" : "sun.max.fill"
    }
    var iconColor: Color {
        isRainy ? Color.blue : Color.yellow
    }
    
    var body: some View {
        VStack {
            Text(day).font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.semibold)
        }
        .padding()
    }
}
