//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["💅", "🫃", "💀", "🤓"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack(alignment: .center) {
            let baseCornerRadius = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                baseCornerRadius
                    .fill(.white)
                    .foregroundColor(.white)
                baseCornerRadius
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                baseCornerRadius
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
