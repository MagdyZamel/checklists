//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//


import Foundation
import UIKit

class ChecklistItem: NSObject, NSCoding {
    
    var text: String
    var checked: Bool
    
 
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    
    func ChangeCheckedState() {
        checked = !checked
    }
    

}
