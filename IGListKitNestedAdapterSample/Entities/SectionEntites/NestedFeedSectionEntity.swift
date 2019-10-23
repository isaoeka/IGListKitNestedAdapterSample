//
//  NestedFeedSectionEntity.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import IGListKit

final class NestedFeedSectionEntity {

    let id: Int
    let sections: [FeedSectionEntity]

    init(id: Int, sections: [FeedSectionEntity]) {
        self.id = id
        self.sections = sections
    }
}

extension NestedFeedSectionEntity: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? NestedFeedSectionEntity else {
            return false
        }
        return id == object.id
            && sections == object.sections
    }
}
