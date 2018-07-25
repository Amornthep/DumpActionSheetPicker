//
//  DumpHelper.swift
//  DumpActionSheetPicker
//
//  Created by Amornthep Chuaiam on 25/7/2561 BE.
//  Copyright © 2561 Amornthep Chuaiam. All rights reserved.
//

import UIKit

class DumpHelper {
    static func moveViewToPositionY(view:UIView,originY:CGFloat, cellback: (() -> Void)?){
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
    
    static func getDefaultAttibutePickerLabel()->[NSAttributedStringKey : Any]{
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 21),NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.paragraphStyle:paragraphStyle]
    }
    
    static func getRowCountInComponent(components:NSArray,componentIndex:Int)->Int{
        if let component = components[componentIndex] as? NSArray{
            return component.count
        }
        return components.count
    }
    
    static func getComponentCount(components:NSArray)->Int{
        if components.count > 0 && components[0] is NSArray{
            return components.count
        }
        return components.count != 0 ? 1 : 0
    }
    
    static func getDataInArrayWithComponentAndRow(components:NSArray,component:Int,row:Int)->String{
        var data = ""
        if let component = components[component] as? NSArray,let dataString = component[row] as? String{
            data = dataString
        }else if let dataString = components[row] as? String{
            data = dataString
        }
        return data
    }
    
    static func setInitStringArrayEachInArray(items:NSArray,initState:[Int])->[String]{
        var arrayString = [String]()
        
        if items[0] is NSArray {
            var index = 0
            for case let itemArray as NSArray in items {
                if let itemString = itemArray[initState[index]] as? String{
                    arrayString.append(itemString)
                }
                index += 1
            }
        }else if let itemString = items[initState[0]] as? String{
            arrayString.append(itemString)
        }
        
        return arrayString
    }
}
