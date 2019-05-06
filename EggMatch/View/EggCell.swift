//
//  EggCell.swift
//  EggMatch
//
//  Created by Matt Deuschle on 5/5/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class EggCell: UICollectionViewCell {
    
    @IBOutlet weak var eggImageView: UIImageView!
    
    static let reuseIdentifier = "EggCell"
    
    func configure(with eggImage: UIImage) {
        eggImageView.image = eggImage
    }
}
