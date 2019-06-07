//
//  EggCell.swift
//  EggMatch
//
//  Created by Matt Deuschle on 5/5/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class EggCell: UICollectionViewCell {
        
    static let reuseIdentifier = "EggCell"
    static let cellSize: CGFloat = 80
    private var isFrontView = false
    
    lazy var backView: UIImageView = {
        imageView(for: #imageLiteral(resourceName: "blank"))
    }()
    
    lazy var frontView: UIImageView = {
        imageView(for: #imageLiteral(resourceName: "6"))
    }()
    
    private func imageView(for image: UIImage) -> UIImageView {
        let view = UIImageView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: EggCell.cellSize,
                                             height: EggCell.cellSize))
        view.contentMode = .scaleAspectFill
        view.image = image
        return view
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.addSubview(backView)
    }
    
    func flipCard() {
        if isFrontView {
            UIImageView.transition(from: frontView,
                                   to: backView,
                                   duration: 0.3,
                                   options: .transitionFlipFromLeft,
                                   completion: nil)
            isFrontView = false
            
        } else {
            UIImageView.transition(from: backView,
                                   to: frontView,
                                   duration: 0.3,
                                   options: .transitionFlipFromLeft,
                                   completion: nil)
            isFrontView = true
        }
    }
}

