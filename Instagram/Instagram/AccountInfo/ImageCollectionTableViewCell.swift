//
//  ImageCollectionTableViewCell.swift
//  Instagram
//
//  Created by Дмитрий Супрун on 23.10.22.
//

import UIKit

/// TableViewCell with Collection photo content
final class ImageCollectionTableViewCell: UITableViewCell {
    // MARK: - Constants
    enum Constants {
        static let imageCellID = "imageCellID"
    }
    
    // MARK: - Private Visual Components
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    // MARK: - Private Properties
    private func setupCollectionView() {
        imageCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension ImageCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.imageCellID, for: indexPath)
        return cell
    }
}
