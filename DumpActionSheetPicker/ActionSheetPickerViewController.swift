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
    
    var doneCallback:((_ component:Int,_ row:Int) -> ())?
    var valueChangeCallback:((_ component:Int,_ row:Int) -> ())?
    var items:NSArray?
    var pickerHeight:CGFloat = 200
    var actionSheetTitle:String!
    var doneButtonTitle:String!
    var selectRow:Int?
    var selectComponent:Int?
    var pickerFontAttribute = [NSAttributedStringKey : Any]()
    
    var toolBarColor:UIColor = UIColor.darkGray
    var pickerViewColor:UIColor = UIColor.lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerViewConstrainsHeight.constant = pickerHeight
        self.titleLabel.text = actionSheetTitle
        self.doneButton.setTitle(doneButtonTitle, for: .normal)
        self.actionSheetView.frame.origin.y = UIScreen.main.bounds.height +  self.toolBarView.frame.size.height
        self.toolBarView.frame.origin.y = UIScreen.main.bounds.height
        self.toolBarView.backgroundColor = toolBarColor
        self.actionSheetView.backgroundColor = pickerViewColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.moveViewToPositionY(view: actionSheetView, originY: UIScreen.main.bounds.height - pickerHeight , cellback: nil)
        self.moveViewToPositionY(view: toolBarView, originY: UIScreen.main.bounds.height - pickerHeight - toolBarView.frame.size.height , cellback: nil)
    }
    
    func setToolBarColor(color:UIColor){
        self.toolBarColor = color
    }
    
    func setTitleLabelAttributedString(attributed:NSMutableAttributedString){
        self.titleLabel.attributedText = attributed
    }
    
    func setPickerViewColor(color:UIColor){
        self.pickerViewColor = color
    }
    
    func setPickerAttributedText(attributed:[NSAttributedStringKey : Any]){
        self.pickerFontAttribute = attributed
    }
    
    func setDoneCallback(doneCallback:((_ component:Int,_ row:Int) -> ())?){
        self.doneCallback = doneCallback
    }
    
    func setDoneButtonAttributedText(attributed:NSMutableAttributedString){
        self.doneButton.setAttributedTitle(attributed, for: .normal)
    }
    
    func setOnValueChange(valueChangeCallback:((_ component:Int,_ row:Int) -> ())?){
        self.valueChangeCallback = valueChangeCallback
    }
    
    func setData(items:NSArray,title:String = ""){
        self.items = items
        self.actionSheetTitle = title
    }
    
    func setPickerHeight(height:CGFloat){
        self.pickerHeight = height
    }
    
    func setDoneButtonTitle(title:String){
        self.doneButtonTitle = title
    }
    
    @IBAction func doneButtonClick(_ sender: Any) {
        if let callback = doneCallback{
            callback(selectComponent ?? 0, selectRow ?? 0)
        }
        
        self.moveViewToPositionY(view: toolBarView, originY: UIScreen.main.bounds.height, cellback: nil)
        self.moveViewToPositionY(view: actionSheetView, originY: UIScreen.main.bounds.height +  self.toolBarView.frame.size.height , cellback:{
            self.dismiss(animated: false, completion: nil)
        })
    }
    
}

extension ActionSheetPickerViewController{
    
    func moveViewToPositionY(view:UIView,originY:CGFloat, cellback: (() -> Void)?){
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        view.frame.origin.y = originY
        },
                       completion: { finished in
                        if let cellback = cellback {
                            cellback()
                        }
        })
        
    }
    
    func getDefaultAttibutePickerLabel()->[NSAttributedStringKey : Any]{
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 21),NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.paragraphStyle:paragraphStyle]
    }
    
    func getRowCountInComponent(components:NSArray,componentIndex:Int)->Int{
        if let component = components[componentIndex] as? NSArray{
            return component.count
        }
        return components.count
    }
    
    func getComponentCount(components:NSArray)->Int{
        if components.count > 0 && components[0] is NSArray{
            return components.count
        }
        return components.count != 0 ? 1 : 0
    }
    
    func getDataInArrayWithComponentAndRow(components:NSArray,component:Int,row:Int)->String{
        var data = ""
        if let component = components[component] as? NSArray,let dataString = component[row] as? String{
            data = dataString
        }else if let dataString = components[row] as? String{
            data = dataString
        }
        return data
    }
}

extension ActionSheetPickerViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return getComponentCount(components: items ?? NSArray())
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return getRowCountInComponent(components: items ?? NSArray(), componentIndex: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectComponent = component
        selectRow = row
        if let callback = valueChangeCallback{
            callback(component, row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }
        
        let text = getDataInArrayWithComponentAndRow(components: items ?? NSArray(), component: component, row: row)
        
        if pickerFontAttribute.isEmpty {
            pickerFontAttribute =  getDefaultAttibutePickerLabel()
        }
        
        label.attributedText = NSMutableAttributedString(string: text,attributes: pickerFontAttribute)
        
        return label
    }
}
