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
        var  sum = 0
        
        if !self.isEmpty{
            for i in self.characters{
                if i == " "{
                    sum = sum + 1
                }
            }
        }
        if sum == self.characters.count{
            return true
        }else{
            return false
        }
    }
}
