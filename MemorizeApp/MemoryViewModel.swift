//
//  MemoryViewModel.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

class MemoryViewModel: ObservableObject {
    private static let emojis = ["💅", "🫃", "💀", "🤓", "💅", "🫃", "💀", "🤓"]

    private static func createMemoryGame() -> MemorizeGameModel<String> {
        return MemorizeGameModel(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉"
            }
        }
    }

    @Published var model = createMemoryGame()

    var cards: Array<MemorizeGameModel<String>.Card> {
        return model.cards
    }

    // MARK: - Intents

    func shuffle() {
        model.shuffle()
    }

    func choose (_ card: MemorizeGameModel<String>.Card) {
        model.choose(card)
    }
}
