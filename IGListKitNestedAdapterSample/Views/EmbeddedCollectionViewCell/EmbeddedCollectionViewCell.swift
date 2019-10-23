//
//  EmbeddedCollectionViewCell.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import UIKit

final class EmbeddedCollectionViewCell: UICollectionViewCell {

    // MARK: Views

    @IBOutlet private(set) weak var collectionView: UICollectionView!

    // MARK: Properties

    override func awakeFromNib() {
        super.awakeFromNib()
        initializeViews()
    }
}

extension EmbeddedCollectionViewCell {

    private func initializeViews() {

        layer.masksToBounds = true
        layer.cornerRadius = 4
        layer.borderWidth = 2
        layer.borderColor = UIColor.blue.cgColor

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = flowLayout
    }
}
