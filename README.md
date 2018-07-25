# DumpActionSheetPicker
Simple picker in actionsheet

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate DumpActionSheetPicker into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'DumpActionSheetPicker'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Example
```swift
import DumpActionSheetPicker

let actionSheet = ActionSheetPicker(title: "Title", items: [["1","2"],["3","4","5"],["3","4","5"]], target: self) { (index, value) in
            print("\(index) \(value)")
        }
actionSheet.show()
```
<img src="https://github.com/Amornthep/DumpActionSheetPicker/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202018-07-24%20at%2012.56.59.png" width="300">

### Setting
```swift
init(title:String,items:NSArray,target:UIViewController,doneClick: @escaping ([Int],[String]) -> ())

open func setBackgroundColor(color:UIColor)
    
open func setPickerTextAttribute(attribute:[NSAttributedStringKey : Any])
    
open func setInitialSelection(selected:[Int])
    
open func setClickBackgroundEnable(isEnable:Bool)
    
open func onPickerValueChange(onChange:((_ index:[Int],_ value:[String]) -> ())?)
    
open func setPickerHeight(height:CGFloat)
    
open func setToolBarColor(color:UIColor)
    
open func setDoneButtonAttributedText(attributed:NSMutableAttributedString)
    
open func setPickerViewColor(color:UIColor)
    
open func setDoneButtonTitle(title:String)
    
open func setTitleLabelAttributedString(attributed:NSMutableAttributedString)
    
open func show()
```
