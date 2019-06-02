//
//  Game.swift
//  EggMatch
//
//  Created by Matt Deuschle on 5/26/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

protocol GameDelegate: AnyObject {
    func gameOver()
}

import Foundation

class Game {
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    private(set) var score = 0
    weak var delegate: GameDelegate?
    init(delegate: GameDelegate) {
        self.delegate = delegate
        cards = CardService.shared.getCards()
    }
    
    func select(card: Card) {
        if card.isFaceUp || card.isMatched {
            return
        }
        let faceUpCards = cards.filter { $0.isFaceUp }
        let faceUpCard = faceUpCards.first
        switch faceUpCards.count {
        case 0:
            card.isFaceUp = true
        case 1:
            card.isFaceUp = true
            if faceUpCard?.id == card.id {
                faceUpCard?.isMatched = true
                card.isMatched = true
                score += 2
            } else {
                score -= 1
            }
            let matchedCards = cards.filter { $0.isMatched }
            if cards.count == matchedCards.count {
                delegate?.gameOver()
            }
        case 2:
            faceUpCards.forEach { $0.isFaceUp = false }
            card.isFaceUp = true
        default:
            faceUpCards.forEach { $0.isFaceUp = false }
            card.isFaceUp = true
        }
    }
}
