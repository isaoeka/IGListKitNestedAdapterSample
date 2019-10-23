//
//  FeedSectionEntity.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import IGListKit

final class FeedSectionEntity {

    let id: Int
    let titles: [String]

    init(id: Int, titles: [String]) {
        self.id = id
        self.titles = titles
    }
}

extension FeedSectionEntity: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? FeedSectionEntity else {
            return false
        }
        return id == object.id
            && titles == object.titles
    }
}
