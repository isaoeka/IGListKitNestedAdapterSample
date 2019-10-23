//
//  IGListCollectionContext+Extensions.swift
//  IGListKitNestedAdapterSample
//
//  Created by isaoeka on 2019/10/24.
//

import IGListKit

extension ListCollectionContext {

    public func dequeueReusableCellWithNib<T: UICollectionViewCell>(_ cellType: T.Type, for sectionController: ListSectionController, at index: Int) -> T {
        return dequeueReusableCell(withNibName: T.className, bundle: Bundle(for: T.self), for: sectionController, at: index) as! T
    }
}
