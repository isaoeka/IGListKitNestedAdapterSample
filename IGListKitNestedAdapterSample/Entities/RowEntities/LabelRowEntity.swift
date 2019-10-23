//
//  LabelRowEntity.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import IGListKit

final class LabelRowEntity {

    let id: String
    let title: String

    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}

extension LabelRowEntity: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? LabelRowEntity else {
            return false
        }
        return self == object
    }
}

extension LabelRowEntity: Equatable {

    static func == (lhs: LabelRowEntity, rhs: LabelRowEntity) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
    }
}
