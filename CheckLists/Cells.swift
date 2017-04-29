//
//  CellsTableViewCell.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var details: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    var data:Category!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    func updateCellWith(data:Category) {
        self.data = data
        self.name.text = self.data.name
        self.icon.image = UIImage(named: data.imageName)
        
        if  self.data.isEmpty {
            self.details!.text = "No Items"
        } else if data.isAllDone {
            self.details!.text = "All Tasks have been Done"
        } else {
            self.details!.text = "\(self.data.numberOfUnCheckedItems) Remaining to Compelet"
        }
    
    
    }
}

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var chechedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    
    func updateCellwith(ChecklistItem item: ChecklistItem) {
        name.text = item.text
        if item.checked {
            chechedLabel.text = "√ "
        } else {
            chechedLabel.text = ""
        }
    }

    
}
