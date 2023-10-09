//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var myEmojis: [String] = ["💅", "🫃", "💀", "🤓", "💅", "🫃", "💀", "🤓"]

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            let shuffledCards = myEmojis.shuffled()

            ForEach(myEmojis.indices, id: \.self) { index in
                CardView(content: shuffledCards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack(alignment: .center) {
            let baseCornerRadius = RoundedRectangle(cornerRadius: 12)
            Group {
                baseCornerRadius
                    .fill(.white)
                    .foregroundColor(.white)
                baseCornerRadius
                    .strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            baseCornerRadius
                .fill()
                .opacity(isFaceUp ? 0 : 1)
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
