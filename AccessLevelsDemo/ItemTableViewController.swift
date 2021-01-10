//
//  ItemTebleViewControllerTableViewController.swift
//  AccessLevelsDemo
//
//  Created by Nazar Dranhovskyi on 10.01.2021.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleItems()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! ViewController
            if let selectedCell = sender as? ItemTableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedItem = items[indexPath.row]
                detailVC.item = selectedItem
            }
        }
        else if segue.identifier == "AddItem" {
            
        }
    }
    
    @IBAction func unwindToList(sender: UIStoryboardSegue) {
        let srcViewCon = sender.source as? ViewController
        let item = srcViewCon?.item
        if (srcViewCon != nil && item?.name != "") {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                items[selectedIndexPath.row] = item!
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                let newIndexPath = IndexPath(row: items.count, section: 0)
                items.append(item!)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
        }
    }
    
    func loadSampleItems() {
        items += [Item(name: "Item1"), Item(name: "Item2"), Item(name: "Item3")]
    }

}
