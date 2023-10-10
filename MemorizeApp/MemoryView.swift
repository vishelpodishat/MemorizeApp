//
//  MemoryView.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

struct MemoryView: View {
    @ObservedObject var viewModel: MemoryViewModel

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(Color.red)
    }
}

struct CardView: View {
    let card: MemorizeGameModel<String>.Card

    var body: some View {
        ZStack(alignment: .center) {
            let baseCornerRadius = RoundedRectangle(cornerRadius: 12)
            Group {
                baseCornerRadius
                    .fill(.white)
                    .foregroundColor(.white)
                baseCornerRadius
                    .strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            baseCornerRadius
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(viewModel: MemoryViewModel())
    }
}
