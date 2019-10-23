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
        return feedSectionEntity.titles.count
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let collectionViewSize = collectionContext!.containerSize(for: self)
        return CGSize(
            width: collectionViewSize.width,
            height: 50
        )
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "LabelCollectionViewCell", bundle: nil, for: self, at: index) as! LabelCollectionViewCell
        let title = feedSectionEntity.titles[index]
        cell.title = "\(title) : \(String(format: "% 3d", index))"
        return cell
    }
}
