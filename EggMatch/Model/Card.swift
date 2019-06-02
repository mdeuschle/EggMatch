//
//  Card.swift
//  EggMatch
//
//  Created by Matt Deuschle on 5/26/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class Card {
    var isFaceUp = false
    var isMatched = false
    let image: UIImage
    let id: Int
    init(image: UIImage, id: Int) {
        self.image = image
        self.id = id
    }
}
