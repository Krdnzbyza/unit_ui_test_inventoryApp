//
//  unit_ui_test_inventory_appTests.swift
//  unit_ui_test_inventory_appTests
//
//  Created by Beyza Karadeniz on 13.09.2023.
//

import XCTest
@testable import unit_ui_test_inventory_app

final class unit_ui_test_inventory_appTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //bu class her baslatıldgında testAddItem ve testAddItem2 tekrar calısıcak ve hatalı fail olacak
        //bu kod  singlteon oluşyrulan manager count sayısı static 4 kabul ediyor
        //bu if saysinde tekrar tekrar eklememizi sağlıyor
        if InventoryManager.items.count != 4 {
            InventoryManager.init()
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //en son testAddItem2 den sonra temizleiyor
        InventoryManager.items = []
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testAddItem() {
        let item = InventoryItem(name: "Beyza", units: 4, manufacturerName: "BMW", dateAdded: "1/1/2022")
        InventoryManager.add(item: item)

        XCTAssertEqual(InventoryManager.items.count, 5)
    }
    func testAddItem2() {
        let item = InventoryItem(name: "Karadeniz", units: 4, manufacturerName: "BMW", dateAdded: "1/1/2022")
        InventoryManager.add(item: item)

        XCTAssertEqual(InventoryManager.items.count, 5)
    }
    func testAddItemVerifyDetails() {
        let item = InventoryItem(name: "Karadeniz2", units: 4, manufacturerName: "BMW", dateAdded: "1/1/2022")
        InventoryManager.add(item: item)

        let newItem = InventoryManager.items[InventoryManager.items.count - 1]
        XCTAssertEqual(newItem.name, "Karadeniz2")
        XCTAssertEqual(newItem.units, 4)
        XCTAssertEqual(newItem.manufacturerName, "BMW")

    }
    func deleteItem() {
        InventoryManager.delete(index: 0)
        XCTAssertEqual(InventoryManager.items.count, 3)
    }
    func testCellForRowAt()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InitialViewController") as! ViewController
        XCTAssertNotNil(vc.view, "Problem initializing view")
        vc.viewDidLoad()
        let cell = vc.tableView(vc.tableViewMain, cellForRowAt: IndexPath(row: 0, section: 0)) as! TableViewCell
        XCTAssertEqual(cell.name.text, "Highlander")

    }
}
