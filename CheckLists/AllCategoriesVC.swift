//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class AllCategoriesVC: UITableViewController, CategoryDetailsDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataManager.defaultManager.allCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")  as! CategoryCell
        cell.updateCellWith(data: DataManager.defaultManager.allCategories[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowAllItems", sender: DataManager.defaultManager.allCategories[indexPath.row])
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowAllItems" {
            
            let controller = segue.destination as! ChecklistItemsVC
            controller.checklist = sender as! Category
            
        } else if segue.identifier == "AddNewCategory" {
            
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! CategoryDetailVc
            controller.delegate = self
        }else if segue.identifier == "EditCategory"{
            
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! CategoryDetailVc
            
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.categoryToEdit = DataManager.defaultManager.allCategories[indexPath.row]
            }
            
            
        }
    }
    
    
    
    
    
    func CategoryDetails( AddingDidCanceled controller: CategoryDetailVc){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func CategoryDetails(_ controller: CategoryDetailVc, didFinishAdding checklist: Category){
        DataManager.defaultManager.allCategories.append(checklist)
        DataManager.defaultManager.saveCategories()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func CategoryDetails(_ controller: CategoryDetailVc, didFinishEditing checklist: Category){
        tableView.reloadData()
        DataManager.defaultManager.saveCategories()
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        DataManager.defaultManager.allCategories.remove(at: indexPath.row)
        DataManager.defaultManager.saveCategories()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
}
