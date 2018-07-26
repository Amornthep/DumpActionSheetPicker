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

    public init(title:String,items:NSArray,target:UIViewController,doneClick: @escaping ([Int],[String]) -> ()) {
        super.init()
        
        let podBundle = Bundle(for: ActionSheetPickerViewController.self)
        let bundleURL = podBundle.url(forResource: "DumpActionSheetPicker", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "ActionSheetPicker", bundle: bundle)
        let actionSheetVC_ = storyboard.instantiateViewController(withIdentifier: "ActionSheetPickerViewController") as! ActionSheetPickerViewController
        self.actionSheetVC = actionSheetVC_
        self.actionSheetVC.setData(items: items, title: title)
        self.actionSheetVC.setDoneCallback(doneCallback: doneClick)
        self.target = target
    }
    
    open func setBackgroundColor(color:UIColor){
        self.actionSheetVC.backgroundColor = color
    }
    
    open func setPickerAttribute(attribute:[NSAttributedStringKey : Any]){
        self.actionSheetVC.setPickerAttributedText(attributed: attribute)
    }

    open func setPickerAttributed(attributed:NSMutableAttributedString){
        self.actionSheetVC.setPickerAttributedText(attributed: attributed)
    }
    
    open func setInitialSelection(selected:[Int]){
        self.actionSheetVC.setInitialSelection(selected: selected)
    }
    
    open func setClickBackgroundEnable(isEnable:Bool){
        self.actionSheetVC.setClickBackgroundEnable(isEnable: isEnable)
    }
    
    open func onPickerValueChange(onChange:((_ index:[Int],_ value:[String]) -> ())?){
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


