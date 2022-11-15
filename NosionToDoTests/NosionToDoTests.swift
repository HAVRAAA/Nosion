//
//  NosionToDoTests.swift
//  NosionToDoTests
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import XCTest
@testable import NosionToDo

class NosionToDoTests: XCTestCase {
    
    let sut = ListViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testAddedAWarnCharacter() throws {
        let newTask = "Buy a cat"
        
        
        let result = try sut.addedExclamationMark(text: newTask)
        
        XCTAssertEqual(result, "Buy a cat!")
    }
    
    func testEnterVoidMessage() throws {
        let voidMessage = ""
        
        let result = try sut.addedExclamationMark(text: voidMessage)
        
        XCTAssertTrue(result.isEmpty)
    }
}
