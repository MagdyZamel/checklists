//
//  Utilities.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import Foundation

extension String{
    
    func isEmpty()->Bool{
            return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).characters.count == 0
    }
}
