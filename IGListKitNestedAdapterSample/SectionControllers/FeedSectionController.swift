//
//  FeedSectionController.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/23.
//

import IGListKit

final class FeedSectionController: ListSectionController {

    private var feedSectionEntity: FeedSectionEntity!

    override init() {
        super.init()
        inset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
    }

    override func didUpdate(to object: Any) {
        feedSectionEntity = object as? FeedSectionEntity
    }

    override func numberOfItems() -> Int {
        return feedSectionEntity.rows.count
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let collectionViewSize = collectionContext!.containerSize(for: self)
        return CGSize(width: collectionViewSize.width, height: 50)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCellWithNib(LabelCollectionViewCell.self, for: self, at: index)
        let title = feedSectionEntity.rows[index].title
        cell.title = "\(title): \(String(format: "Section: % 2d Index: % 3d", section, index))"
        return cell
    }
}
