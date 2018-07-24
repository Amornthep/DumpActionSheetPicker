//
//  ActionSheetPicker.swift
//  MultiPickerPickerActionSheet
//
//  Created by Amornthep Chuaiam on 13/7/2561 BE.
//  Copyright © 2561 Amornthep Chuaiam. All rights reserved.
//

import UIKit

open class ActionSheetPicker: NSObject {
    private var target:UIViewController!
    private var actionSheetVC:ActionSheetPickerViewController!

    public init(title:String,items:NSArray,target:UIViewController,doneClick: @escaping (Int,Int) -> ()) {
        super.init()
        let storyboard: UIStoryboard = UIStoryboard(name: "ActionSheetPicker", bundle: Bundle(for: ActionSheetPicker.self))
        let actionSheetVC_ = storyboard.instantiateViewController(withIdentifier: "ActionSheetPickerViewController") as! ActionSheetPickerViewController
        self.actionSheetVC = actionSheetVC_
        self.actionSheetVC.setData(items: items, title: title)
        self.actionSheetVC.setDoneCallback(doneCallback: doneClick)
        self.target = target
    }
    
    open func setPickerTextAttribute(attribute:[NSAttributedStringKey : Any]){
        self.actionSheetVC.setPickerAttributedText(attributed: attribute)
    }
    
    open func onPickerValueChange(onChange:((_ component:Int,_ row:Int) -> ())?){
        self.actionSheetVC.setOnValueChange(valueChangeCallback: onChange)
    }
    
    open func setPickerHeight(height:CGFloat){
        self.actionSheetVC.setPickerHeight(height: height)
    }
    
    open func setToolBarColor(color:UIColor){
        self.actionSheetVC.setToolBarColor(color: color)
    }
    
    open func setDoneButtonAttributedText(attributed:NSMutableAttributedString){
        self.actionSheetVC.setDoneButtonAttributedText(attributed: attributed)
    }
    
    open func setPickerViewColor(color:UIColor){
        self.actionSheetVC.setPickerViewColor(color: color)
    }
    
    open func setDoneButtonTitle(title:String){
        self.actionSheetVC.setDoneButtonTitle(title: title)
    }
    
    open func setTitleLabelAttributedString(attributed:NSMutableAttributedString){
        self.actionSheetVC.setTitleLabelAttributedString(attributed: attributed)
    }
    
    open func show(){
        actionSheetVC.modalPresentationStyle = .overCurrentContext
        target.present(actionSheetVC, animated: false, completion: nil)
    }
    
}


