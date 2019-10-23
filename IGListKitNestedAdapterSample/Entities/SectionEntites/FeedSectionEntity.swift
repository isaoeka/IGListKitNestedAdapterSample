//
//  FeedSectionEntity.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import IGListKit

final class FeedSectionEntity {

    let id: Int
    let rows: [LabelRowEntity]

    init(id: Int, rows: [LabelRowEntity]) {
        self.id = id
        self.rows = rows
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
            && rows == object.rows
    }
}

extension FeedSectionEntity: Equatable {

    static func == (lhs: FeedSectionEntity, rhs: FeedSectionEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.rows == rhs.rows
    }
}
