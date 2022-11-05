//
//  StoriesTableViewCell.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 23.10.22.
//

import UIKit

/// User stories list
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Constants
    enum Constants {
        static let storiesCellID = "storiesCellID"
    }
    
    // Private Visual Components
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    // MARK: - Private Properties
    private func setupCollectionView() {
        storiesCollectionView.dataSource = self
        storiesCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDelegate
extension StoriesTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension StoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.storiesCellID, for: indexPath)
        return cell
    }
}
