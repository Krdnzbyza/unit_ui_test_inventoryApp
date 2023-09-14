//
//  unit_ui_test_inventory_appUITests.swift
//  unit_ui_test_inventory_appUITests
//
//  Created by Beyza Karadeniz on 13.09.2023.
//

import XCTest

final class unit_ui_test_inventory_appUITests: XCTestCase {

    var topLevelApp: XCUIApplication? = nil
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
        topLevelApp = XCUIApplication()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        topLevelApp = nil
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    func testClickToDetailView() {
//storuboard ilgili table view inspector de ki içerisinden user attribute kısmından table view key vererek eşleşti ve nerede oldugun anlasılıyor
        topLevelApp?.tables["mainTable"]/*@START_MENU_TOKEN@*/.staticTexts["Highlander"]/*[[".cells.staticTexts[\"Highlander\"]",".staticTexts[\"Highlander\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        topLevelApp?.staticTexts["Toyota"].tap()
        topLevelApp?.navigationBars["unit_ui_test_inventory_app.DetailView"].buttons["Back"].tap()

    }
    func testAddOneItem() {
        addOne()
        XCTAssertEqual(topLevelApp?.tables["mainTable"].cells.count, 5)
    }

    func addOne() {
        //belirlennen yerlerde kendisi dolasır ve bu adımları test eder
        XCUIApplication().navigationBars["unit_ui_test_inventory_app.View"].buttons["Add"].tap()
        let modelTextField = topLevelApp?.textFields["model"]
        modelTextField?.tap()
        modelTextField?.typeText("Beyza")
//        modelTextField.tap()
//        modelTextField.tap()

        let unitsTextField = topLevelApp?.textFields["units"]
        unitsTextField?.tap()
        unitsTextField?.typeText("10")

        let makeTextField = topLevelApp?.textFields["make"]
        makeTextField?.tap()
        topLevelApp?.buttons["Add"].tap()
        topLevelApp?.navigationBars["unit_ui_test_inventory_app.AddView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()

        //XCTAssertEqual ile yukardai işlem ile table view cell sayısın 5 oldugunu kontrol eder eşitse test succes olur
     //   let table = topLevelApp?.tables["mainTable"]    //
       // XCTAssertEqual(table?.cells.count, 5)           // bu iki satırı testAddOneItem içerisine taıyarak classları ortaklaştırıyoruz

    }

    func testAddOneDeleteSame() {
        XCUIApplication().navigationBars["unit_ui_test_inventory_app.View"].buttons["Add"].tap()
        let app = XCUIApplication()
        let modelTextField = topLevelApp?.textFields["model"]
        modelTextField?.tap()
        modelTextField?.typeText("Beyza")

        let unitsTextField = topLevelApp?.textFields["units"]
        unitsTextField?.tap()
        unitsTextField?.typeText("10")

        let makeTextField = topLevelApp?.textFields["make"]
        makeTextField?.tap()
        topLevelApp?.buttons["Add"].tap()
        topLevelApp?.navigationBars["unit_ui_test_inventory_app.AddView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        let maintableTable = topLevelApp?.tables["mainTable"]
        maintableTable?.staticTexts["Beyza"].swipeLeft()
        maintableTable?.buttons["Delete"].tap()
    }

    ///testAddOneDeleteSame fonk temizlenmiş ve kısa hali
    func testAddOneDelete() {
        addOne()
        XCTAssertEqual(topLevelApp?.tables.cells.count, 5)
        testDeleteOne()
    }

    func testDeleteOne(rowCount: Int? = 3) {
        let maintableTable = topLevelApp?.tables["mainTable"]
        maintableTable?.staticTexts["Beyza"].swipeLeft()
        maintableTable?.buttons["Delete"].tap()

        XCTAssertEqual(maintableTable?.cells.count,  rowCount)
    }
}
