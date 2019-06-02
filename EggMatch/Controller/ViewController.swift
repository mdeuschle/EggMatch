//
//  ViewController.swift
//  EggMatch
//
//  Created by Matt Deuschle on 5/5/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var highScoreLabel: UILabel!
    @IBOutlet private var gamesPlayedLabel: UILabel!
    @IBOutlet private var flipCountLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var collectionView: UICollectionView!
    
    lazy private var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "EggCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: EggCell.reuseIdentifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EggCell.reuseIdentifier, for: indexPath) as? EggCell else {
            return EggCell()
        }
        let card = game.cards[indexPath.row]
        let image = card.isFaceUp ? card.image : #imageLiteral(resourceName: "ShakeAndSee")
        cell.configure(with: image)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = game.cards[indexPath.row]
        game.select(card: card)
        flipCountLabel.text = "\(game.flipCount)"
        collectionView.reloadData()
        print(card.id)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}


