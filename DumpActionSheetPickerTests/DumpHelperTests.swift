//
//  DumpHelperTests.swift
//  DumpActionSheetPickerTests
//
//  Created by Amornthep Chuaiam on 25/7/2561 BE.
//  Copyright © 2561 Amornthep Chuaiam. All rights reserved.
//

import XCTest
@testable import DumpActionSheetPicker

class DumpHelperTests: XCTestCase {
    
    let arrayTest:NSArray = [["1","2"],["1"]]
    let array2Test:NSArray = ["1","2"]
    let array3Test:NSArray = []
    var defaultAttibute = [NSAttributedStringKey : Any]()
    
    override func setUp() {
        super.setUp()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        defaultAttibute = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 21),NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.paragraphStyle:paragraphStyle]
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetComponentCount(){
        let count = DumpHelper.getComponentCount(components: arrayTest)
        XCTAssertEqual(2, count)
        
        let count2 = DumpHelper.getComponentCount(components: array2Test)
        XCTAssertEqual(1, count2)
        
        let count3 = DumpHelper.getComponentCount(components: array3Test)
        XCTAssertEqual(0, count3)
    }
    
    func testGetDataInArrayWithComponentAndRow(){
        let data = DumpHelper.getDataInArrayWithComponentAndRow(components: arrayTest, component: 0, row: 1)
        XCTAssertEqual("2", data)
        
        let data2 = DumpHelper.getDataInArrayWithComponentAndRow(components: array2Test, component: 0, row: 1)
        XCTAssertEqual("2", data2)
    }
    
    func testGetRowCountInComponent(){
        let data = DumpHelper.getRowCountInComponent(components: arrayTest, componentIndex: 0)
        XCTAssertEqual(2, data)
        
        let data2 = DumpHelper.getRowCountInComponent(components: array2Test, componentIndex: 0)
        XCTAssertEqual(2, data2)
    }
    
    func testGetDefaultAttibutePickerLabel(){
        let attibute = DumpHelper.getDefaultAttibutePickerLabel()
        XCTAssertEqual(defaultAttibute.count, attibute.count)
    }
    
    func testInitState(){
        let initString = DumpHelper.setInitStringArrayEachInArray(items: arrayTest, initState: [1,0])
        XCTAssertEqual(["2","1"],initString)
        let initString2 = DumpHelper.setInitStringArrayEachInArray(items: array2Test, initState: [1])
        XCTAssertEqual(["2"],initString2)
    }
}
