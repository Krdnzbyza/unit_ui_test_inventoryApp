//
//  ViewController.swift
//  unit_ui_test_inventory_app
//
//  Created by Beyza Karadeniz on 13.09.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableViewMain: UITableView!
    var inventoryItem:InventoryItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableViewMain.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        InventoryManager.init()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewMain.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InventoryManager.items.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
        let i = InventoryManager.items[indexPath.row]
        //cell.textLabel?.text = i.name
        cell.name.text = i.name
        cell.vendorName.text = i.manufacturerName
        cell.inventory.text = String(describing: i.units)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        inventoryItem = InventoryManager.items[indexPath.row]
        self.performSegue(withIdentifier: "detailView", sender: self)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            InventoryManager.delete(index: indexPath.row)
            tableViewMain.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailView",
            let destinationController = segue.destination as? DetailViewController {
            destinationController.inventoryItem = inventoryItem
        }
    }

}
