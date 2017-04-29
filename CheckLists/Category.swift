//
//  Checklist.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class Category: NSObject, NSCoding {
    var name: String
    var items: [ChecklistItem]
    var imageName: String
    
    var numberOfCheckedItems:Int{
        
        get {
            var  count = 0
            for item in items {
                if item.checked{
                    count = count + 1
                }
            }
            return count
        }
    }
    
    var numberOfUnCheckedItems:Int{
    
        get {
            return items.count - numberOfCheckedItems
        }
    }
    
    var isAllDone :Bool{
        get {
            return items.count == numberOfCheckedItems
        }
    }
    var isEmpty :Bool{
        get {
            return items.count == 0
        }
    }
    
    
    init(name: String, items: [ChecklistItem], iconName: String) {
        self.name = name
        self.items = items
        self.imageName = iconName
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [ChecklistItem]
        imageName = aDecoder.decodeObject(forKey: "IconName") as! String
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
        aCoder.encode(imageName
            , forKey: "IconName")
    }
    
    
}
