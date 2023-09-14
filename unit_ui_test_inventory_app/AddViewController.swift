//
//  AddViewController.swift
//  unit_ui_test_inventory_app
//
//  Created by Beyza Karadeniz on 13.09.2023.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var model: UITextField!
    @IBOutlet var units: UITextField!
    @IBOutlet var make: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addButton_click(_ sender: AnyObject) {
        let i = InventoryItem(name: model?.text ?? "" , units: Int(units?.text ?? "") ?? 0, manufacturerName: make.text ?? "", dateAdded: String(describing: Date()))
        InventoryManager.add(item: i)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
