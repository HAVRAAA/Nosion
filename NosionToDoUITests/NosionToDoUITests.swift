//
//  NosionToDoUITests.swift
//  NosionToDoUITests
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import XCTest

class NosionToDoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testEnterVoidMessageInAlertTextfield() {
        let app = XCUIApplication()
        app.launch()

        
        app.buttons["taskEmpty"].tap()
        app.buttons["taskEmpty"].tap()
        app.navigationBars["NosionToDo.ListView"].buttons["Add"].tap()
        app.alerts["New task"].scrollViews.otherElements.buttons["Ok"].tap()
        
        XCTAssert(app.cells.accessibilityTraits.isEmpty)
    }
    
    func testAddedNewTask() {
        let app = XCUIApplication()
        app.launch()

        
        app.buttons["taskEmpty"].tap()
        app.buttons["taskEmpty"].tap()
        app.navigationBars["NosionToDo.ListView"].buttons["Add"].tap()
        
        
        app.alerts.textFields.element.typeText("Buy a new car")
        app.alerts.scrollViews.otherElements.buttons["Ok"].tap()
        
        
        XCTAssert(app.cells.staticTexts["Buy a new car"].exists)
    }
    
    func testCleanTableSheet() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["taskEmpty"].tap()
        app.buttons["taskEmpty"].tap()
        
        app.navigationBars["NosionToDo.ListView"].buttons["Add"].tap()
        
        
        app.alerts.textFields.element.typeText("Buy a new car")
        app.alerts.scrollViews.otherElements.buttons["Ok"].tap()
        
        app.buttons["C L E A N"].tap()
        
        XCTAssert(app.cells.accessibilityTraits.isEmpty)
    }
   
//    func testTransitionUserNameInGreetingMessage() {
//        let app = XCUIApplication()
//        app.launch()
//
//        app.buttons["taskEmpty"].tap()
//        app.textFields["Press your name"].tap()
//        app.textFields["Press your name"].typeText("Maks")
//
//        app.buttons["taskEmpty"].tap()
//    }
    
    func testGreetingMessageWithUnknownUser() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["taskEmpty"].tap()
        app.buttons["taskEmpty"].tap()
        
        XCTAssert(app.staticTexts["Hello, world"].exists)
    }
}
