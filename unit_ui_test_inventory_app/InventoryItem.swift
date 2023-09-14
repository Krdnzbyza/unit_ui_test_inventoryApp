//
//  InventoryItem.swift
//  unit_ui_test_inventory_app
//
//  Created by Beyza Karadeniz on 13.09.2023.
//
import UIKit

class InventoryItem: NSObject {
    var name:String = ""
    var units:Int = 0
    var manufacturerName:String = ""
    var dateAdded:Date

    init(name:String, units:Int, manufacturerName:String, dateAdded:String){
        self.name = name
        self.units = units
        self.manufacturerName = manufacturerName
        let dateFormatter = DateFormatter()

        if(dateAdded.contains("/")){
            dateFormatter.dateFormat = "MM/dd/yyyy"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        }
        self.dateAdded = dateFormatter.date(from: dateAdded)!
    }
}
