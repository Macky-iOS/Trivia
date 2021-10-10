

import UIKit

enum OptionType{
    case singleSelection, multipleSelection
}


extension OptionType{
    enum imageType: String{
        case singleSelection,singleSelectionSelected,multipleSelectionselected
        
        var value: UIImage {
            return UIImage(named: rawValue) ?? UIImage()
        }
    }
}


enum ConstantsStrings{
    enum Stringss{
        static let needNameMessage = "Please enter your name to proceed any further."
        static let needOptionMessage = "Please select atleast one of the following options to proceed"
    }
}
