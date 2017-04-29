//
//  ItemDetailvc.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class ItemDetailvc: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var descriptionLable: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    var editableitem: ChecklistItem?
    
    weak var delegate: ItemDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = editableitem {
            title = "Edit Item"
            descriptionLable.text = item.text
            doneButton.isEnabled = true
        }
        descriptionLable.becomeFirstResponder()
   
    }
    
    @IBAction func done() {
        
        if let item = editableitem {
            item.text = descriptionLable.text!
            delegate?.itemDetails(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem(text: descriptionLable.text!, checked: false)
            delegate?.itemDetails(self, didFinishAdding: item)
        }
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.itemDetails(addingDidCanceled: self)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
      

        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string)
        
        doneButton.isEnabled = newText.characters.count > 0 && !newText.isEmpty()
        
        return true
    }
    
}

