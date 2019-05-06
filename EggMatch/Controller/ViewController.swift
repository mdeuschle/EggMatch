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
    
    var eggImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let eggImage = UIImage(named: "image01")
        eggImages = Array.init(repeating: eggImage!, count: 20)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        let nib = UINib(nibName: "EggCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: EggCell.reuseIdentifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EggCell.reuseIdentifier, for: indexPath) as? EggCell else {
            return EggCell()
        }
        let image = eggImages[indexPath.row]
        cell.configure(with: image)
        return cell
    }
}

