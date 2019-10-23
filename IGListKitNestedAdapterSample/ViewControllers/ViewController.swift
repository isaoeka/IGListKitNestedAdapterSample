//
//  ViewController.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/23.
//  Copyright © 2019 isaoeka. All rights reserved.
//

import UIKit
import IGListKit

final class ViewController: UIViewController {

    // MARK: Views

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: Properties

    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    private let sectionEntites: [ListDiffable] = [
        NestedFeedSectionEntity(id: 1, sections: [
            FeedSectionEntity(id: 101, rows: [LabelRowEntity](repeating: LabelRowEntity(id: UUID().uuidString, title: "A"), count: 10))
        ]),
        FeedSectionEntity(id: 2, rows: [LabelRowEntity](repeating: LabelRowEntity(id: UUID().uuidString, title: "B"), count: 5)),
        NestedFeedSectionEntity(id: 3, sections: [
            FeedSectionEntity(id: 301, rows: [LabelRowEntity](repeating: LabelRowEntity(id: UUID().uuidString, title: "C"), count: 10))
        ]),
        FeedSectionEntity(id: 4, rows: [LabelRowEntity](repeating: LabelRowEntity(id: UUID().uuidString, title: "D"), count: 5)),
        NestedFeedSectionEntity(id: 5, sections: [
            FeedSectionEntity(id: 501, rows: [LabelRowEntity](repeating: LabelRowEntity(id: UUID().uuidString, title: "E"), count: 10))
        ]),
        FeedSectionEntity(id: 6, rows: [LabelRowEntity](repeating: LabelRowEntity(id: UUID().uuidString, title: "F"), count: 5)),
    ]

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension ViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return sectionEntites
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is FeedSectionEntity:
            return FeedSectionController()
        case is NestedFeedSectionEntity:
            return NestedFeedSectionController()
        default:
            fatalError("Impossible case")
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
