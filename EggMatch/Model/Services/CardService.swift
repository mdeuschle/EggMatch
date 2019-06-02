//
//  CardService.swift
//  EggMatch
//
//  Created by Matt Deuschle on 5/26/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

struct CardService {
    let numberOfCards = 3
    static let shared = CardService()
    private init() {}
    func getCards() -> [Card] {
        var cards = [Card]()
        for i in 1...numberOfCards {
            let image = UIImage(named: "\(i)") ?? UIImage()
            let card1 = Card(image: image, id: i)
            let card2 = Card(image: image, id: i)
            cards.append(card1)
            cards.append(card2)
        }
        return cards.shuffled()
    }
}
