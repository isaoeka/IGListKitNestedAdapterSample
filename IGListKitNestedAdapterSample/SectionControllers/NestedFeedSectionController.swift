//
//  NestedFeedSectionController.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import IGListKit

final class NestedFeedSectionController: ListSectionController {

    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
    private var nestedFeedSectionEntity: NestedFeedSectionEntity!

    override init() {
        super.init()
        inset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
        adapter.dataSource = self
    }

    override func didUpdate(to object: Any) {
        nestedFeedSectionEntity = object as? NestedFeedSectionEntity
    }

    override func numberOfItems() -> Int {
        return nestedFeedSectionEntity.sections.count
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let collectionViewSize = collectionContext!.containerSize(for: self)
        return CGSize(width: collectionViewSize.width, height: 120)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "EmbeddedCollectionViewCell", bundle: nil, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }
}

extension NestedFeedSectionController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return nestedFeedSectionEntity.sections
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return NestedFeedEmbeddedSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

