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
    private let listData: [ListDiffable] = [
        FeedSectionEntity(id: 1, titles: [String](repeating: "Section 1", count: 20)),
        FeedSectionEntity(id: 2, titles: [String](repeating: "Section 2", count: 20)),
        FeedSectionEntity(id: 3, titles: [String](repeating: "Section 3", count: 20))
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
        return listData
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is FeedSectionEntity:
            return FeedSectionController()
        default:
            fatalError("Impossible case")
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
