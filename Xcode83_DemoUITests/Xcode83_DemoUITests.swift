//
//  Xcode83_DemoUITests.swift
//  Xcode83_DemoUITests
//
//  Created by Shashikant Jagtap on 25/01/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import XCTest

class Xcode83_DemoUITests: XCTestCase {
        
    let lazyButton = XCUIApplication().buttons["Lazy Button"]
    let helloTimeout = XCUIApplication().staticTexts["Hello"]
    let helloCompleted = XCUIApplication().textFields["LazyHello"]
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
       
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func waiterResultWithExpextation(_ element: XCUIElement) -> XCTWaiterResult {
        let myPredicate = NSPredicate(format: "exists == true")
        let myExpectation = expectation(for: myPredicate, evaluatedWith: element,
                                      handler: nil)
        
        let result = XCTWaiter().wait(for: [myExpectation], timeout: 5)
        return result
    }
    
    func waiterResultWithXCTPredicateExpextation(_ element: XCUIElement) -> XCTWaiterResult {
        let myPredicate = NSPredicate(format: "exists == true")
        let myExpectation = XCTNSPredicateExpectation(predicate: myPredicate,
                                                      object: element)
        let result = XCTWaiter().wait(for: [myExpectation], timeout: 5)
        return result
    }
    
    func waiterResultWithXCTKVOPredicateExpextation(_ element: XCUIElement) -> XCTWaiterResult {
        
        let myExpectation = XCTKVOExpectation(keyPath: "exists", object: element,
                                              expectedValue: true)
        let result = XCTWaiter().wait(for: [myExpectation], timeout: 5)
        return result
    }

    func testWaiterTimeout() {
        lazyButton.tap()
        XCTAssertTrue(waiterResultWithExpextation(helloTimeout) == .timedOut)
    }
    
    func testWaiterCompletion() {
        lazyButton.tap()
        XCTAssertTrue(waiterResultWithExpextation(lazyButton) == .completed)
        
    }
    
    func testWaiterTimeoutXCTPredicate() {
        lazyButton.tap()
        XCTAssertTrue(waiterResultWithXCTPredicateExpextation(helloTimeout) == .timedOut)
    }
    
    func testWaiterCompletionXCTPredicate() {
        lazyButton.tap()
        XCTAssertTrue(waiterResultWithXCTPredicateExpextation(lazyButton) == .completed)
        
    }
    
    func testWaiterTimeoutXCTKVOPPredicate() {
        lazyButton.tap()
        XCTAssertTrue(waiterResultWithXCTKVOPredicateExpextation(helloTimeout) == .timedOut)
    }
    
    func testWaiterCompletionXCTKVOPPredicate() {
        lazyButton.tap()
        XCTAssertTrue(waiterResultWithXCTKVOPredicateExpextation(lazyButton) == .completed)
        
    }
    
}
