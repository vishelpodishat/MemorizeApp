//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["💅", "🫃", "💀", "🤓", "💅", "🫃", "💀", "🤓"]
    @State var cardCount: Int = 4

    var body: some View {
        VStack {
            cardCountAdjusters
            Spacer()
            ScrollView {
                cards
            }
        }
        .padding()
    }

    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }

    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardAdder: some View {
        cardCountAdjusters(by: +1, symbol: "plus")
    }

    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "minus")
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
