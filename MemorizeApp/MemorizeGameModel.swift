//
//  MemorizeGameModel.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import Foundation

struct MemorizeGameModel<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {
    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
