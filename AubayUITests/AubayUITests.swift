//
//  AubayUITests.swift
//  AubayUITests
//
//  Created by Marcelo Reis on 22/08/2024.
//
import XCTest

class AubayUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationToStatePopulationView() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Assuming the first cell in the list represents the nation data
        let firstNationCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstNationCell.exists, "The first nation cell should exist")
        
        // Tap on the first nation cell to navigate to the State Population view
        firstNationCell.tap()
        
        // Verify that the State Population view is displayed
        let statePopulationNavBar = app.navigationBars["State Population Data"]
        XCTAssertTrue(statePopulationNavBar.exists, "Should navigate to the State Population View")
    }

    func testBackNavigationToNationPopulationView() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstNationCell = app.tables.cells.element(boundBy: 0)
        firstNationCell.tap()

        // Navigate back
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssertTrue(backButton.exists, "Back button should exist")
        backButton.tap()

        // Verify that we are back on the Nation Population View
        let nationPopulationNavBar = app.navigationBars["Nation Population Data"]
        XCTAssertTrue(nationPopulationNavBar.exists, "Should navigate back to the Nation Population View")
    }
    
    func testNationPopulationListContent() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Wait until the list appears
        let nationTable = app.tables.element
        XCTAssertTrue(nationTable.waitForExistence(timeout: 5), "Nation population list should appear")
        
        // Check that the list has at least one cell
        let firstNationCell = nationTable.cells.element(boundBy: 0)
        XCTAssertTrue(firstNationCell.exists, "There should be at least one nation cell in the list")
        
        // Optionally, check the content of the first cell
        XCTAssertTrue(firstNationCell.staticTexts["Mock Nation"].exists, "The nation cell should display the correct nation name")
    }
    
    func testStatePopulationListContent() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to State Population View
        let firstNationCell = app.tables.cells.element(boundBy: 0)
        firstNationCell.tap()
        
        // Wait until the list appears
        let stateTable = app.tables.element
        XCTAssertTrue(stateTable.waitForExistence(timeout: 5), "State population list should appear")
        
        // Check that the list has at least one cell
        let firstStateCell = stateTable.cells.element(boundBy: 0)
        XCTAssertTrue(firstStateCell.exists, "There should be at least one state cell in the list")
        
        // Optionally, check the content of the first cell
        XCTAssertTrue(firstStateCell.staticTexts["Mock State"].exists, "The state cell should display the correct state name")
    }
}
