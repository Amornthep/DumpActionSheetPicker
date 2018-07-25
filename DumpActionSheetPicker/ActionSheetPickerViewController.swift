//
//  ActionSheetPickerViewController.swift
//  MultiPickerPickerActionSheet
//
//  Created by Amornthep Chuaiam on 16/7/2561 BE.
//  Copyright © 2561 Amornthep Chuaiam. All rights reserved.
//

import UIKit
import Foundation

class ActionSheetPickerViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewConstrainsHeight: NSLayoutConstraint!
    @IBOutlet weak var actionSheetView: UIView!
    @IBOutlet weak var toolBarView: UIView!
    @IBOutlet weak var backgroundButton: UIButton!
    
    var doneCallback:((_ index:[Int],_ value:[String]) -> ())?
    var valueChangeCallback:((_ index:[Int],_ value:[String]) -> ())?
    var items:NSArray?
    var pickerHeight:CGFloat = 200
    var actionSheetTitle:String!
    var doneButtonTitle:String = "Done"
    var selectIndex = [Int]()
    var selectValue = [String]()
    var pickerFontAttribute = [NSAttributedStringKey : Any]()
    var doneButtonAttribute:NSMutableAttributedString!
    var titleAttribute:NSMutableAttributedString!
    
    var toolBarColor:UIColor = UIColor.darkGray
    var pickerViewColor:UIColor = UIColor.lightGray
    var backgroundColor:UIColor = UIColor.clear
    var clickBackGroundEnable = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = backgroundColor
        self.selectValue = DumpHelper.setInitStringArrayEachInArray(items: items ?? NSArray(), initState: self.selectIndex)
        self.pickerViewConstrainsHeight.constant = pickerHeight
        self.titleLabel.text = actionSheetTitle
        self.doneButton.setTitle(doneButtonTitle, for: .normal)
        self.actionSheetView.frame.origin.y = UIScreen.main.bounds.height +  self.toolBarView.frame.size.height
        self.toolBarView.frame.origin.y = UIScreen.main.bounds.height
        self.toolBarView.backgroundColor = toolBarColor
        self.actionSheetView.backgroundColor = pickerViewColor
        self.backgroundButton.isEnabled = clickBackGroundEnable
        
        if let doneButtonAttribute = doneButtonAttribute{
            self.doneButton.setAttributedTitle(doneButtonAttribute, for: .normal)
        }
        if let titleAttribute = titleAttribute{
            self.titleLabel.attributedText = titleAttribute
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DumpHelper.moveViewToPositionY(view: actionSheetView, originY: UIScreen.main.bounds.height - pickerHeight , cellback: nil)
        DumpHelper.moveViewToPositionY(view: toolBarView, originY: UIScreen.main.bounds.height - pickerHeight - toolBarView.frame.size.height , cellback: nil)
        
        for component in 0..<selectIndex.count {
            self.pickerView.selectRow(selectIndex[component], inComponent: component, animated: false)
        }
    }
    
    @IBAction func backgroundButtonClick(_ sender: Any) {
        DumpHelper.moveViewToPositionY(view: toolBarView, originY: UIScreen.main.bounds.height, cellback: nil)
        DumpHelper.moveViewToPositionY(view: actionSheetView, originY: UIScreen.main.bounds.height +  self.toolBarView.frame.size.height , cellback:{
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    @IBAction func doneButtonClick(_ sender: Any) {
        if let callback = doneCallback{
            callback(selectIndex, selectValue)
        }
        
        DumpHelper.moveViewToPositionY(view: toolBarView, originY: UIScreen.main.bounds.height, cellback: nil)
        DumpHelper.moveViewToPositionY(view: actionSheetView, originY: UIScreen.main.bounds.height +  self.toolBarView.frame.size.height , cellback:{
            self.dismiss(animated: false, completion: nil)
        })
    }
    
}

extension ActionSheetPickerViewController{
    func setBackgroundColor(color:UIColor){
        self.backgroundColor = color
    }
    
    func setClickBackgroundEnable(isEnable:Bool){
        self.clickBackGroundEnable = isEnable
    }
    
    func setToolBarColor(color:UIColor){
        self.toolBarColor = color
    }
    
    func setTitleLabelAttributedString(attributed:NSMutableAttributedString){
        self.titleAttribute = attributed
    }
    
    func setPickerViewColor(color:UIColor){
        self.pickerViewColor = color
    }
    
    func setInitialSelection(selected:[Int]){
        self.selectIndex = selected
    }
    
    func setPickerAttributedText(attributed:[NSAttributedStringKey : Any]){
        self.pickerFontAttribute = attributed
    }
    
    func setDoneCallback(doneCallback:((_ index:[Int],_ value:[String]) -> ())?){
        self.doneCallback = doneCallback
    }
    
    func setDoneButtonAttributedText(attributed:NSMutableAttributedString){
        self.doneButtonAttribute = attributed
    }
    
    func setOnValueChange(valueChangeCallback:((_ index:[Int],_ value:[String]) -> ())?){
        self.valueChangeCallback = valueChangeCallback
    }
    
    func setData(items:NSArray,title:String = ""){
        self.items = items
        self.selectIndex = Array(repeating: 0, count: DumpHelper.getComponentCount(components: items))
        self.actionSheetTitle = title
    }
    
    func setPickerHeight(height:CGFloat){
        self.pickerHeight = height
    }
    
    func setDoneButtonTitle(title:String){
        self.doneButtonTitle = title
    }
}

extension ActionSheetPickerViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return DumpHelper.getComponentCount(components: items ?? NSArray())
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DumpHelper.getRowCountInComponent(components: items ?? NSArray(), componentIndex: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectIndex[component] = row
        selectValue[component] = DumpHelper.getDataInArrayWithComponentAndRow(components: items ?? NSArray(), component: component, row: row)
        if let callback = valueChangeCallback{
            callback(selectIndex,selectValue)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }
        
        let text = DumpHelper.getDataInArrayWithComponentAndRow(components: items ?? NSArray(), component: component, row: row)
        
        if pickerFontAttribute.isEmpty {
            pickerFontAttribute =  DumpHelper.getDefaultAttibutePickerLabel()
        }
        label.attributedText = NSMutableAttributedString(string: text,attributes: pickerFontAttribute)
        
        return label
    }
}
