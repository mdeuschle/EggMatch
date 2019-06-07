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
    
    private var game: Game?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        game = Game(delegate: self)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
//        let nib = UINib(nibName: "EggCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: EggCell.reuseIdentifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game?.cards.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EggCell.reuseIdentifier, for: indexPath) as? EggCell else {
            return EggCell()
        }
        guard let game = game else { return EggCell() }
        let card = game.cards[indexPath.row]
//        let image = card.isFaceUp ? card.image : #imageLiteral(resourceName: "blank")
        cell.isHidden = card.isMatched
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? EggCell else {
            return
        }

        guard let game = game else { return }
        
        cell.flipCard()
        
        
//        let card = game.cards[indexPath.row]
        
        
//        game.select(card: card)
//        flipCountLabel.text = "Flip Count: \(game.flipCount)"
//        scoreLabel.text = "Score: \(game.score)"
//        collectionView.reloadData()
        

    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}

extension ViewController: GameDelegate {
    func gameOver() {
        let alertController = UIAlertController(title: "Game Over",
                                                message: nil,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "New Game",
                                   style: .default) { _ in
                                    self.game = nil
                                    self.game = Game(delegate: self)
                                    self.collectionView.reloadData()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        print("GAME OVER")
    }
    
    func cardsMatched() {
        collectionView.reloadData()
    }
}


