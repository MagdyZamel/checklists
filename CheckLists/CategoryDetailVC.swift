//
//  CategoryDetailVc.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import Foundation
import UIKit

class CategoryDetailVc: UITableViewController, UITextFieldDelegate ,SelectImageDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var imageIcon: UIImageView!
    
    weak var delegate: CategoryDetailsDelegate?
    
    var categoryToEdit: Category?
    
    var imageName = "Folder"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let categoryToEdit = categoryToEdit {
            title = "Edit Category"
            name.text = categoryToEdit.name
            doneButton.isEnabled = true
            imageName = categoryToEdit.imageName
        }
        
        imageIcon.image = UIImage(named: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        name.becomeFirstResponder()
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickImage" {
            let controller = segue.destination as! SelectImageVC
            controller.delegate = self
        }
    }
    
    
    
    @IBAction func cancel() {
        delegate?.CategoryDetails(AddingDidCanceled: self)
    }
    
    @IBAction func done() {

        if let categoryToEdit = categoryToEdit {
            categoryToEdit.name = name.text!
            categoryToEdit.imageName = imageName

            
            delegate?.CategoryDetails(self, didFinishEditing: categoryToEdit)
        } else {

            let checklist = Category(name: name.text!, items: [], iconName: imageName)
            delegate?.CategoryDetails(self, didFinishAdding: checklist)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 1 {
            return indexPath
        } else {
            return nil
        }
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        

        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string)
        
        doneButton.isEnabled = newText.characters.count > 0 && !newText.isEmpty()
        
        return true
    }

    func selectImage(_ picker: SelectImageVC, didPickImage image: String) {
        self.imageName = image
        imageIcon.image = UIImage(named: image)
        navigationController!.popViewController(animated: true)
    }
}

