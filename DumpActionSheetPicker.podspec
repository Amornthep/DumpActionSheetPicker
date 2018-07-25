
Pod::Spec.new do |s|

  s.name         = "DumpActionSheetPicker"
  s.version      = "1.0.7"
  s.summary      = "Simple picker in actionsheet."

  s.description  = "Simple multiple picker in actionsheet."

  s.homepage     = "https://github.com/Amornthep/DumpActionSheetPicker"


  s.license      = "MIT"


  s.author             = { "Amornthep" => "illusion.zen@gmail.com" }

    s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/Amornthep/DumpActionSheetPicker.git", :tag => "1.0.7" }
  s.source_files  = "DumpActionSheetPicker"
  s.resource_bundles = {
    'DumpActionSheetPicker' => ['DumpActionSheetPicker/*.{storyboard,xib}']
  }
  s.swift_version = "4.0" 

end
