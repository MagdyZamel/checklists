//
//  ChecklistItemsVC.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class ChecklistItemsVC:UITableViewController, ItemDetailsDelegate {
    
    var checklist: Category!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItemCell", for: indexPath) as! ItemCell
        cell.updateCellwith(ChecklistItem: checklist.items[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        checklist.items.remove(at: indexPath.row)
        DataManager.defaultManager.saveCategories()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? ItemCell{
            checklist.items[indexPath.row].ChangeCheckedState()
            cell.updateCellwith(ChecklistItem: checklist.items[indexPath.row])
        }
    }
    
    
    func itemDetails(addingDidCanceled controller: ItemDetailvc) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetails(_ controller: ItemDetailvc, didFinishAdding item: ChecklistItem){
        addItem(item: item)
        DataManager.defaultManager.saveCategories()
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetails(_ controller: ItemDetailvc, didFinishEditing item: ChecklistItem){
        if let index = checklist.items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) as? ItemCell {
                DataManager.defaultManager.saveCategories()
                cell.updateCellwith(ChecklistItem: item)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    func addItem(item: ChecklistItem) {
        let newIndex = checklist.items.count
        checklist.items.append(item)
        let indexPath = IndexPath(row: newIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add" {
           let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailvc
            controller.delegate = self
        } else if segue.identifier == "Edit" {
           let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailvc
            
            controller.delegate = self
        
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.editableitem = checklist.items[indexPath.row]
            }
        }
    }
}

