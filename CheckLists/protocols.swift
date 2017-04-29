//
//  protocols.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import Foundation

protocol ItemDetailsDelegate: class {
    func itemDetails(addingDidCanceled controller: ItemDetailvc)
    func itemDetails(_ controller: ItemDetailvc, didFinishAdding item: ChecklistItem)
    func itemDetails(_ controller: ItemDetailvc, didFinishEditing item: ChecklistItem)
}

protocol CategoryDetailsDelegate: class {
    
    func CategoryDetails( AddingDidCanceled controller: CategoryDetailVc)
    func CategoryDetails(_ controller: CategoryDetailVc, didFinishAdding checklist: Category)
    func CategoryDetails(_ controller: CategoryDetailVc, didFinishEditing checklist: Category)

    
}

protocol SelectImageDelegate: class {
    func selectImage(_ picker: SelectImageVC, didPickImage image: String)
}

