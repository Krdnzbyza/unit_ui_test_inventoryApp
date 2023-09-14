//
//  DetailViewController.swift
//  unit_ui_test_inventory_app
//
//  Created by Beyza Karadeniz on 13.09.2023.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var units: UILabel!
    @IBOutlet var vendor: UILabel!
    @IBOutlet var vendorUrl: UILabel!
    var inventoryItem:InventoryItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.name.text = inventoryItem?.name
        self.units.text = String(describing: (inventoryItem?.units)!)
        self.vendor.text = inventoryItem?.manufacturerName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
