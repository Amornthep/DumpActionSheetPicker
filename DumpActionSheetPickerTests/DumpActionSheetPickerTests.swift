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
    var doneCallback:((_ index:[Int],_ value:[String]) -> ())?
    var valueCallback:((_ index:[Int],_ value:[String]) -> ())?
    var actionSheetPicker: ActionSheetPicker!
    var defaultAttibute = [NSAttributedStringKey : Any]()
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "ActionSheetPicker", bundle: Bundle(for: ActionSheetPickerViewController.self))
        actionSheetPickerViewController = storyboard.instantiateViewController(withIdentifier: "ActionSheetPickerViewController") as! ActionSheetPickerViewController
        doneCallback = { component, row in }
        valueCallback = { component, row in }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        defaultAttibute = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 21),NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.paragraphStyle:paragraphStyle]
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
    
    func testSetDoneButtonClickCallBack(){
        actionSheetPickerViewController.setDoneCallback(doneCallback:doneCallback)
        XCTAssertNotNil(actionSheetPickerViewController.doneCallback)
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
        XCTAssertEqual(actionSheetPickerViewController.pickerFontAttribute.count,defaultAttibute.count)
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
    
    func testSetInitSelected(){
        actionSheetPickerViewController.setInitialSelection(selected: [0,1])
        XCTAssertEqual(actionSheetPickerViewController.selectIndex,[0,1])
    }
    
    func testSetClickBackgroundEnable(){
        actionSheetPickerViewController.setClickBackgroundEnable(isEnable: false)
        XCTAssertEqual(actionSheetPickerViewController.clickBackGroundEnable,false)
    }
    
    func testSetBackgroundColor(){
        actionSheetPickerViewController.setBackgroundColor(color: UIColor.red)
        XCTAssertEqual(actionSheetPickerViewController.backgroundColor,UIColor.red)
    }
    
    func testSetTitleAttributr(){
        actionSheetPickerViewController.setTitleLabelAttributedString(attributed: NSMutableAttributedString(string: "Title"))
        XCTAssertEqual(actionSheetPickerViewController.titleAttribute,NSMutableAttributedString(string: "Title"))
    }
    
    func testSetDoneButtonAttributr(){
        actionSheetPickerViewController.setDoneButtonAttributedText(attributed: NSMutableAttributedString(string: "Title"))
        XCTAssertEqual(actionSheetPickerViewController.doneButtonAttribute,NSMutableAttributedString(string: "Title"))
    }
}
