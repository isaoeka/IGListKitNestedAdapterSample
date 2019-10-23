//
//  LabelCollectionViewCell.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {

    // MARK: Views

    @IBOutlet private weak var label: UILabel!

    // MARK: Properties

    var title: String {
        get { return label.text ?? "" }
        set { label.text = newValue }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initializeViews()
    }
}

extension LabelCollectionViewCell {

    private func initializeViews() {

        label.backgroundColor = .lightGray
        label.text = ""
    }
}
