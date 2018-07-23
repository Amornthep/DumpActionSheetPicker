//
//  DumpActionSheetPickerTests.swift
//  DumpActionSheetPickerTests
//
//  Created by Amornthep Chuaiam on 19/7/2561 BE.
//  Copyright © 2561 Amornthep Chuaiam. All rights reserved.
//

import XCTest
@testable import DumpActionSheetPicker

class DumpActionSheetPickerTests: XCTestCase {
    
    let arrayTest:NSArray = [["1","2"],["1"]]
    let array2Test:NSArray = ["1","2"]
    let array3Test:NSArray = []
    var actionSheetPickerViewController: ActionSheetPickerViewController!
    var doneCallback:((_ component:Int,_ row:Int) -> ())?
    var valueCallback:((_ component:Int,_ row:Int) -> ())?
    var actionSheetPicker: ActionSheetPicker!
    var defaultAttibute:[NSAttributedStringKey : NSObject]!
    
    override func setUp() {
        super.setUp()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        defaultAttibute = [kCTFontAttributeName as NSAttributedStringKey:UIFont.systemFont(ofSize: 21),kCTForegroundColorAttributeName as NSAttributedStringKey:UIColor.black,kCTParagraphStyleAttributeName as NSAttributedStringKey:paragraphStyle]
        let storyboard: UIStoryboard = UIStoryboard(name: "ActionSheetPicker", bundle: Bundle(for: ActionSheetPickerViewController.self))
        actionSheetPickerViewController = storyboard.instantiateViewController(withIdentifier: "ActionSheetPickerViewController") as! ActionSheetPickerViewController
        doneCallback = { component, row in }
        valueCallback = { component, row in }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        actionSheetPicker = nil
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
        let count = actionSheetPickerViewController.getComponentCount(components: arrayTest)
        XCTAssertEqual(2, count)
        
        let count2 = actionSheetPickerViewController.getComponentCount(components: array2Test)
        XCTAssertEqual(1, count2)
        
        let count3 = actionSheetPickerViewController.getComponentCount(components: array3Test)
        XCTAssertEqual(0, count3)
    }
    
    func testGetDataInArrayWithComponentAndRow(){
        let data = actionSheetPickerViewController.getDataInArrayWithComponentAndRow(components: arrayTest, component: 0, row: 1)
        XCTAssertEqual("2", data)
        
        let data2 = actionSheetPickerViewController.getDataInArrayWithComponentAndRow(components: array2Test, component: 0, row: 1)
        XCTAssertEqual("2", data2)
    }
    
    func testGetRowCountInComponent(){
        let data = actionSheetPickerViewController.getRowCountInComponent(components: arrayTest, componentIndex: 0)
        XCTAssertEqual(2, data)
        
        let data2 = actionSheetPickerViewController.getRowCountInComponent(components: array2Test, componentIndex: 0)
        XCTAssertEqual(2, data2)
    }
    
    func testSetDoneButtonClickCallBack(){
        actionSheetPickerViewController.setDoneCallback(doneCallback:doneCallback)
        XCTAssertNotNil(actionSheetPickerViewController.doneCallback)
    }
    
    func testGetDefaultAttibutePickerLabel(){
        let attibute = actionSheetPickerViewController.getDefaultAttibutePickerLabel()
        XCTAssertEqual(defaultAttibute, attibute as? [NSAttributedStringKey : NSObject])
    }
    
    func testSetToolBarColor(){
        actionSheetPickerViewController.setToolBarColor(color: UIColor.black)
        XCTAssertEqual(actionSheetPickerViewController.toolBarColor,UIColor.black)
    }
    
    func testSetPickerColor(){
        actionSheetPickerViewController.setPickerViewColor(color: UIColor.black)
        XCTAssertEqual(actionSheetPickerViewController.pickerViewColor,UIColor.black)
    }
    
    func testSetPickerAttributedText(){
        actionSheetPickerViewController.setPickerAttributedText(attributed: defaultAttibute)
        XCTAssertEqual(actionSheetPickerViewController.pickerFontAttribute?.count,defaultAttibute.count)
    }
    
    func testSetPickerHeight(){
        actionSheetPickerViewController.setPickerHeight(height: 50)
        XCTAssertEqual(actionSheetPickerViewController.pickerHeight,50)
    }
    
    func testSetDoneButtonTitle(){
        actionSheetPickerViewController.setDoneButtonTitle(title: "Title")
        XCTAssertEqual(actionSheetPickerViewController.doneButtonTitle,"Title")
    }
    
    func testSetOnValueChange(){
        actionSheetPickerViewController.setOnValueChange(valueChangeCallback: valueCallback)
        XCTAssertNotNil(actionSheetPickerViewController.valueChangeCallback)
    }
    
    func testSetData(){
        actionSheetPickerViewController.setData(items: arrayTest, title: "Title")
        XCTAssertEqual(actionSheetPickerViewController.items,arrayTest)
        XCTAssertEqual(actionSheetPickerViewController.actionSheetTitle,"Title")
    }
    
}
