//
//  AddingCategoryVC.swift
//  CheckLists
//
//  Created by Magdi Zamel on 4/29/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import Foundation
import UIKit

class SelectImageVC: UITableViewController {
    weak var delegate: SelectImageDelegate?
    
    let images = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        
        let iconName = images[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let imageName = images[indexPath.row]
            
            delegate.selectImage(self,  didPickImage: imageName)
        }
    }
}
